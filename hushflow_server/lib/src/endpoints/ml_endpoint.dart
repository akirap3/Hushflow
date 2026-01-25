import 'package:serverpod/serverpod.dart';
import '../services/ml_service.dart';

/// ML Endpoint
/// Provides email priority predictions using the Python ML service
class MlEndpoint extends Endpoint {
  final _mlService = MlService();
  
  /// Get priority score for a single email
  Future<double> predictPriority(
    Session session,
    int userId,
    String subject,
    String body,
    DateTime receivedAt,
    bool hasUnsubscribe,
    int linkCount,
    int imageCount,
  ) async {
    session.log('Predicting priority for email: ${subject.substring(0, subject.length.clamp(0, 50))}...');
    
    final features = MlService.extractFeatures(
      subject: subject,
      body: body,
      receivedAt: receivedAt,
      hasUnsubscribe: hasUnsubscribe,
      linkCount: linkCount,
      imageCount: imageCount,
    );
    
    try {
      final score = await _mlService.predictPriority(
        userId: userId,
        features: features,
      );
      session.log('Priority score: $score');
      return score;
    } catch (e) {
      session.log('ML prediction failed: $e, using default score');
      return 0.5; // Default score on error
    }
  }
  
  /// Get priority scores for multiple emails (batch)
  /// Each email should be a map with: subject, body, receivedAt, hasUnsubscribe, linkCount, imageCount
  Future<List<double>> predictBatch(
    Session session,
    int userId,
    List<Map<String, dynamic>> emailsData,
  ) async {
    session.log('Batch predicting ${emailsData.length} emails');
    
    final featuresList = emailsData.map((email) {
      final receivedAtStr = email['receivedAt'];
      DateTime receivedAt;
      if (receivedAtStr is DateTime) {
        receivedAt = receivedAtStr;
      } else if (receivedAtStr is String) {
        receivedAt = DateTime.tryParse(receivedAtStr) ?? DateTime.now();
      } else {
        receivedAt = DateTime.now();
      }
      
      return MlService.extractFeatures(
        subject: email['subject'] as String? ?? '',
        body: email['body'] as String? ?? '',
        receivedAt: receivedAt,
        hasUnsubscribe: email['hasUnsubscribe'] as bool? ?? false,
        linkCount: email['linkCount'] as int? ?? 0,
        imageCount: email['imageCount'] as int? ?? 0,
        senderOpenRate: (email['senderOpenRate'] as num?)?.toDouble() ?? 0.5,
        senderFrequency: email['senderFrequency'] as int? ?? 1,
      );
    }).toList();
    
    try {
      final scores = await _mlService.predictBatch(
        userId: userId,
        featuresList: featuresList,
      );
      session.log('Batch prediction complete: ${scores.length} scores');
      return scores;
    } catch (e) {
      session.log('Batch ML prediction failed: $e');
      return List.filled(emailsData.length, 0.5);
    }
  }
}
