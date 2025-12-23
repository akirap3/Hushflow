import 'dart:convert';
import 'package:http/http.dart' as http;

/// XGBoost Client
/// Communicates with Python ML service for predictions
class XgboostClient {
  final String baseUrl;
  
  XgboostClient({required this.baseUrl});

  /// Predict priority score for an email
  Future<double> predict(int userId, Map<String, dynamic> features) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'features': features,
      }),
    );

    if (response.statusCode != 200) {
      throw XgboostException('Prediction failed: ${response.body}');
    }

    final data = jsonDecode(response.body);
    return (data['score'] as num).toDouble();
  }

  /// Batch predict for multiple emails
  Future<List<double>> predictBatch(
    int userId,
    List<Map<String, dynamic>> featuresList,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict/batch'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'features_list': featuresList,
      }),
    );

    if (response.statusCode != 200) {
      throw XgboostException('Batch prediction failed: ${response.body}');
    }

    final data = jsonDecode(response.body);
    return (data['scores'] as List).map((s) => (s as num).toDouble()).toList();
  }

  /// Trigger model training
  Future<TrainingResult> train(
    int userId,
    List<TrainingExample> examples,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/train'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'examples': examples.map((e) => e.toJson()).toList(),
      }),
    );

    if (response.statusCode != 200) {
      throw XgboostException('Training failed: ${response.body}');
    }

    return TrainingResult.fromJson(jsonDecode(response.body));
  }

  /// Check if user has a trained model
  Future<bool> hasModel(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/models/$userId/status'),
    );

    if (response.statusCode == 404) return false;
    if (response.statusCode != 200) {
      throw XgboostException('Status check failed: ${response.body}');
    }

    final data = jsonDecode(response.body);
    return data['has_model'] ?? false;
  }

  /// Get model metrics
  Future<ModelMetrics?> getMetrics(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/models/$userId/metrics'),
    );

    if (response.statusCode == 404) return null;
    if (response.statusCode != 200) {
      throw XgboostException('Metrics fetch failed: ${response.body}');
    }

    return ModelMetrics.fromJson(jsonDecode(response.body));
  }
}

class TrainingExample {
  final Map<String, dynamic> features;
  final bool wasOpened;
  final bool wasClicked;
  final int? interactionTime;

  TrainingExample({
    required this.features,
    required this.wasOpened,
    required this.wasClicked,
    this.interactionTime,
  });

  Map<String, dynamic> toJson() => {
    'features': features,
    'was_opened': wasOpened,
    'was_clicked': wasClicked,
    'interaction_time': interactionTime,
  };
}

class TrainingResult {
  final int version;
  final double accuracy;
  final int samplesUsed;
  final String modelPath;

  TrainingResult({
    required this.version,
    required this.accuracy,
    required this.samplesUsed,
    required this.modelPath,
  });

  factory TrainingResult.fromJson(Map<String, dynamic> json) {
    return TrainingResult(
      version: json['version'],
      accuracy: (json['accuracy'] as num).toDouble(),
      samplesUsed: json['samples_used'],
      modelPath: json['model_path'],
    );
  }
}

class ModelMetrics {
  final double accuracy;
  final double precision;
  final double recall;
  final double f1Score;
  final int trainingSamples;
  final DateTime lastTrainedAt;

  ModelMetrics({
    required this.accuracy,
    required this.precision,
    required this.recall,
    required this.f1Score,
    required this.trainingSamples,
    required this.lastTrainedAt,
  });

  factory ModelMetrics.fromJson(Map<String, dynamic> json) {
    return ModelMetrics(
      accuracy: (json['accuracy'] as num).toDouble(),
      precision: (json['precision'] as num).toDouble(),
      recall: (json['recall'] as num).toDouble(),
      f1Score: (json['f1_score'] as num).toDouble(),
      trainingSamples: json['training_samples'],
      lastTrainedAt: DateTime.parse(json['last_trained_at']),
    );
  }
}

class XgboostException implements Exception {
  final String message;
  XgboostException(this.message);
  
  @override
  String toString() => 'XgboostException: $message';
}
