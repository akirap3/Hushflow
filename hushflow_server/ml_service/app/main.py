from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Dict, Any, Optional
import uvicorn
from .models.predictor import EmailPredictor
from .training.trainer import XGBoostTrainer

app = FastAPI(
    title="Inbox Butler ML Service",
    description="XGBoost-based email priority prediction",
    version="1.0.0"
)

# Store for user models (in production, use proper model registry)
predictors: Dict[int, EmailPredictor] = {}
trainer = XGBoostTrainer()


class PredictRequest(BaseModel):
    user_id: int
    features: Dict[str, Any]


class BatchPredictRequest(BaseModel):
    user_id: int
    features_list: List[Dict[str, Any]]


class TrainingExample(BaseModel):
    features: Dict[str, Any]
    was_opened: bool
    was_clicked: bool
    interaction_time: Optional[int] = None


class TrainRequest(BaseModel):
    user_id: int
    examples: List[TrainingExample]


class PredictResponse(BaseModel):
    score: float


class BatchPredictResponse(BaseModel):
    scores: List[float]


class TrainResponse(BaseModel):
    version: int
    accuracy: float
    samples_used: int
    model_path: str


class ModelStatus(BaseModel):
    has_model: bool


class ModelMetrics(BaseModel):
    accuracy: float
    precision: float
    recall: float
    f1_score: float
    training_samples: int
    last_trained_at: str


@app.get("/health")
async def health():
    return {"status": "healthy"}


@app.post("/predict", response_model=PredictResponse)
async def predict(request: PredictRequest):
    """Predict priority score for a single email"""
    predictor = predictors.get(request.user_id)
    
    if predictor is None:
        # Use default model if no personalized model exists
        predictor = EmailPredictor.get_default()
    
    try:
        score = predictor.predict(request.features)
        return PredictResponse(score=score)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/predict/batch", response_model=BatchPredictResponse)
async def predict_batch(request: BatchPredictRequest):
    """Predict priority scores for multiple emails"""
    predictor = predictors.get(request.user_id)
    
    if predictor is None:
        predictor = EmailPredictor.get_default()
    
    try:
        scores = predictor.predict_batch(request.features_list)
        return BatchPredictResponse(scores=scores)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/train", response_model=TrainResponse)
async def train(request: TrainRequest):
    """Train a personalized model for a user"""
    try:
        result = trainer.train(
            user_id=request.user_id,
            examples=[e.dict() for e in request.examples]
        )
        
        # Load the new model
        predictors[request.user_id] = EmailPredictor.load(result["model_path"])
        
        return TrainResponse(
            version=result["version"],
            accuracy=result["accuracy"],
            samples_used=result["samples_used"],
            model_path=result["model_path"]
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/models/{user_id}/status", response_model=ModelStatus)
async def model_status(user_id: int):
    """Check if user has a trained model"""
    has_model = user_id in predictors or trainer.model_exists(user_id)
    return ModelStatus(has_model=has_model)


@app.get("/models/{user_id}/metrics", response_model=ModelMetrics)
async def model_metrics(user_id: int):
    """Get model metrics for a user"""
    metrics = trainer.get_metrics(user_id)
    if metrics is None:
        raise HTTPException(status_code=404, detail="Model not found")
    return ModelMetrics(**metrics)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
