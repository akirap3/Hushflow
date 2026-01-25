import numpy as np
from typing import Dict, Any, List, Optional
import os
import json
from datetime import datetime

# Make xgboost and sklearn optional
try:
    import xgboost as xgb
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score
    HAS_ML_DEPS = True
except ImportError:
    xgb = None
    HAS_ML_DEPS = False


class XGBoostTrainer:
    """Trainer for personalized XGBoost models"""
    
    FEATURE_ORDER = [
        'content_length',
        'subject_length',
        'hour_received',
        'day_of_week',
        'has_images',
        'image_count',
        'link_count',
        'has_unsubscribe',
        'is_reply',
        'is_forward',
        'exclamation_count',
        'question_count',
        'uppercase_ratio',
        'sender_frequency',
        'sender_open_rate',
    ]
    
    def __init__(self, models_dir: str = "/app/models"):
        self.models_dir = models_dir
        os.makedirs(models_dir, exist_ok=True)
    
    def _get_model_path(self, user_id: int, version: int) -> str:
        user_dir = os.path.join(self.models_dir, str(user_id))
        os.makedirs(user_dir, exist_ok=True)
        return os.path.join(user_dir, f"model_v{version}.xgb")
    
    def _get_metrics_path(self, user_id: int) -> str:
        return os.path.join(self.models_dir, str(user_id), "metrics.json")
    
    def _get_next_version(self, user_id: int) -> int:
        user_dir = os.path.join(self.models_dir, str(user_id))
        if not os.path.exists(user_dir):
            return 1
        
        existing = [f for f in os.listdir(user_dir) if f.startswith("model_v")]
        if not existing:
            return 1
        
        versions = [int(f.split("_v")[1].split(".")[0]) for f in existing]
        return max(versions) + 1
    
    def _prepare_data(self, examples: List[Dict[str, Any]]) -> tuple:
        """Prepare training data from examples"""
        X = []
        y = []
        
        for example in examples:
            features = example['features']
            row = []
            for name in self.FEATURE_ORDER:
                value = features.get(name, 0)
                if isinstance(value, bool):
                    value = int(value)
                if value is None:
                    value = 0
                row.append(float(value))
            X.append(row)
            
            # Target: combination of opened and clicked
            was_opened = example.get('was_opened', False)
            was_clicked = example.get('was_clicked', False)
            
            # Score: 0 = not opened, 0.5 = opened, 1.0 = clicked
            if was_clicked:
                target = 1.0
            elif was_opened:
                target = 0.5
            else:
                target = 0.0
            y.append(target)
        
        return np.array(X), np.array(y)
    
    def train(self, user_id: int, examples: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Train a model for a specific user"""
        if len(examples) < 10:
            raise ValueError("Need at least 10 examples to train")
        
        X, y = self._prepare_data(examples)
        
        # Split for evaluation
        X_train, X_test, y_train, y_test = train_test_split(
            X, y, test_size=0.2, random_state=42
        )
        
        # Create DMatrix
        dtrain = xgb.DMatrix(X_train, label=y_train, feature_names=self.FEATURE_ORDER)
        dtest = xgb.DMatrix(X_test, label=y_test, feature_names=self.FEATURE_ORDER)
        
        # Training parameters
        params = {
            'objective': 'reg:squarederror',
            'max_depth': 6,
            'learning_rate': 0.1,
            'min_child_weight': 1,
            'subsample': 0.8,
            'colsample_bytree': 0.8,
            'eval_metric': 'rmse',
            'seed': 42,
        }
        
        # Train
        evallist = [(dtrain, 'train'), (dtest, 'eval')]
        model = xgb.train(
            params,
            dtrain,
            num_boost_round=100,
            evals=evallist,
            early_stopping_rounds=10,
            verbose_eval=False
        )
        
        # Evaluate
        y_pred = model.predict(dtest)
        # Convert to binary for classification metrics
        y_pred_binary = (y_pred > 0.25).astype(int)
        y_test_binary = (y_test > 0.25).astype(int)
        
        accuracy = accuracy_score(y_test_binary, y_pred_binary)
        precision = precision_score(y_test_binary, y_pred_binary, zero_division=0)
        recall = recall_score(y_test_binary, y_pred_binary, zero_division=0)
        f1 = f1_score(y_test_binary, y_pred_binary, zero_division=0)
        
        # Save model
        version = self._get_next_version(user_id)
        model_path = self._get_model_path(user_id, version)
        model.save_model(model_path)
        
        # Save metrics
        metrics = {
            'accuracy': float(accuracy),
            'precision': float(precision),
            'recall': float(recall),
            'f1_score': float(f1),
            'training_samples': len(examples),
            'last_trained_at': datetime.utcnow().isoformat(),
        }
        with open(self._get_metrics_path(user_id), 'w') as f:
            json.dump(metrics, f)
        
        return {
            'version': version,
            'accuracy': float(accuracy),
            'samples_used': len(examples),
            'model_path': model_path,
        }
    
    def model_exists(self, user_id: int) -> bool:
        """Check if model exists for user"""
        user_dir = os.path.join(self.models_dir, str(user_id))
        if not os.path.exists(user_dir):
            return False
        return any(f.startswith("model_v") for f in os.listdir(user_dir))
    
    def get_metrics(self, user_id: int) -> Optional[Dict[str, Any]]:
        """Get metrics for user model"""
        metrics_path = self._get_metrics_path(user_id)
        if not os.path.exists(metrics_path):
            return None
        with open(metrics_path, 'r') as f:
            return json.load(f)
