import numpy as np
import xgboost as xgb
from typing import Dict, Any, List, Optional
import os
import pickle


class EmailPredictor:
    """XGBoost-based email priority predictor"""
    
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
    
    def __init__(self, model: Optional[xgb.Booster] = None):
        self.model = model
    
    @classmethod
    def get_default(cls) -> 'EmailPredictor':
        """Get or create default model"""
        default_path = os.path.join(os.path.dirname(__file__), '../../models/default.xgb')
        
        if os.path.exists(default_path):
            return cls.load(default_path)
        
        # Return a predictor that uses heuristics
        return cls(model=None)
    
    @classmethod
    def load(cls, path: str) -> 'EmailPredictor':
        """Load model from file"""
        model = xgb.Booster()
        model.load_model(path)
        return cls(model=model)
    
    def _prepare_features(self, features: Dict[str, Any]) -> np.ndarray:
        """Convert feature dict to ordered numpy array"""
        result = []
        for name in self.FEATURE_ORDER:
            value = features.get(name, 0)
            # Convert booleans to int
            if isinstance(value, bool):
                value = int(value)
            # Handle missing values
            if value is None:
                value = 0
            result.append(float(value))
        return np.array([result])
    
    def predict(self, features: Dict[str, Any]) -> float:
        """Predict priority score for single email"""
        if self.model is None:
            return self._heuristic_score(features)
        
        X = self._prepare_features(features)
        dmatrix = xgb.DMatrix(X, feature_names=self.FEATURE_ORDER)
        score = self.model.predict(dmatrix)[0]
        return float(score)
    
    def predict_batch(self, features_list: List[Dict[str, Any]]) -> List[float]:
        """Predict priority scores for multiple emails"""
        if self.model is None:
            return [self._heuristic_score(f) for f in features_list]
        
        X = np.vstack([self._prepare_features(f) for f in features_list])
        dmatrix = xgb.DMatrix(X, feature_names=self.FEATURE_ORDER)
        scores = self.model.predict(dmatrix)
        return [float(s) for s in scores]
    
    def _heuristic_score(self, features: Dict[str, Any]) -> float:
        """Fallback heuristic scoring when no model is available"""
        score = 0.5  # Base score
        
        # Sender engagement is most important
        sender_open_rate = features.get('sender_open_rate', 0.5)
        score += (sender_open_rate - 0.5) * 0.3
        
        # Replies are usually important
        if features.get('is_reply', False):
            score += 0.15
        
        # Promotional indicators lower score
        if features.get('has_unsubscribe', False):
            score -= 0.1
        
        # Many links often indicate promotional content
        link_count = features.get('link_count', 0)
        if link_count > 10:
            score -= 0.1
        
        # Subject with all caps is usually spam-like
        uppercase_ratio = features.get('uppercase_ratio', 0)
        if uppercase_ratio > 0.5:
            score -= 0.1
        
        # Time of day preferences (business hours slightly higher)
        hour = features.get('hour_received', 12)
        if 9 <= hour <= 17:
            score += 0.05
        
        return max(0.0, min(1.0, score))
