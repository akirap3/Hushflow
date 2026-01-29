import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service to call the Python ML API for email priority predictions
class MlService {
  final String baseUrl;
  
  MlService({this.baseUrl = 'http://localhost:8000'});
  
  /// Predict priority score for a single email
  Future<double> predictPriority({
    required int userId,
    required Map<String, dynamic> features,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'features': features,
      }),
    );
    
    if (response.statusCode != 200) {
      throw Exception('ML prediction failed: ${response.body}');
    }
    
    final data = jsonDecode(response.body);
    return (data['score'] as num).toDouble();
  }
  
  /// Predict priority scores for multiple emails (batch)
  Future<List<double>> predictBatch({
    required int userId,
    required List<Map<String, dynamic>> featuresList,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict/batch'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'features_list': featuresList,
      }),
    );
    
    if (response.statusCode != 200) {
      throw Exception('ML batch prediction failed: ${response.body}');
    }
    
    final data = jsonDecode(response.body);
    return (data['scores'] as List).map((s) => (s as num).toDouble()).toList();
  }
  
  /// Extract features from an email for ML prediction
  static Map<String, dynamic> extractFeatures({
    required String subject,
    required String body,
    required DateTime receivedAt,
    required bool hasUnsubscribe,
    required int linkCount,
    required int imageCount,
    double senderOpenRate = 0.5,
    int senderFrequency = 1,
  }) {
    final subjectUpper = subject.replaceAll(RegExp(r'[^A-Z]'), '');
    final subjectLen = subject.length;
    final uppercaseRatio = subjectLen > 0 ? subjectUpper.length / subjectLen : 0.0;
    
    return {
      'content_length': body.length,
      'subject_length': subjectLen,
      'hour_received': receivedAt.hour,
      'day_of_week': receivedAt.weekday,
      'has_images': imageCount > 0,
      'image_count': imageCount,
      'link_count': linkCount,
      'has_unsubscribe': hasUnsubscribe,
      'is_reply': subject.toLowerCase().startsWith('re:'),
      'is_forward': subject.toLowerCase().startsWith('fwd:') || 
                    subject.toLowerCase().startsWith('fw:'),
      'exclamation_count': RegExp(r'!').allMatches(subject).length,
      'question_count': RegExp(r'\?').allMatches(subject).length,
      'uppercase_ratio': uppercaseRatio,
      'sender_frequency': senderFrequency,
      'sender_open_rate': senderOpenRate,
    };
  }
}
