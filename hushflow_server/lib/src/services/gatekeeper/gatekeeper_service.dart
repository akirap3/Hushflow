/// Gatekeeper Service
/// First-pass filter for incoming emails
/// - AI Judge for exclusion decisions
/// - Subscription detection
/// - Feature extraction for ML ranking

class GatekeeperService {
  final SubscriptionDetector _subscriptionDetector;
  final AiJudgeService _aiJudge;
  final FeatureExtractor _featureExtractor;

  GatekeeperService({
    required SubscriptionDetector subscriptionDetector,
    required AiJudgeService aiJudge,
    required FeatureExtractor featureExtractor,
  })  : _subscriptionDetector = subscriptionDetector,
        _aiJudge = aiJudge,
        _featureExtractor = featureExtractor;

  /// Process an incoming email through the gatekeeper
  Future<GatekeeperResult> process(EmailInput input) async {
    // 1. Detect if this is a subscription/newsletter
    final isSubscription = _subscriptionDetector.detect(input);

    // 2. Check if sender should be excluded (AI judgment)
    final shouldExclude = await _aiJudge.shouldExclude(input);

    // 3. Extract features for ML ranking
    final features = _featureExtractor.extract(input);

    return GatekeeperResult(
      isSubscription: isSubscription.isSubscription,
      subscriptionConfidence: isSubscription.confidence,
      shouldExclude: shouldExclude.exclude,
      exclusionReason: shouldExclude.reason,
      features: features,
      unsubscribeLink: isSubscription.unsubscribeLink,
    );
  }
}

class EmailInput {
  final String from;
  final String fromEmail;
  final String subject;
  final String bodyPlain;
  final String bodyHtml;
  final List<String> labels;
  final String? category;
  final DateTime receivedAt;

  EmailInput({
    required this.from,
    required this.fromEmail,
    required this.subject,
    required this.bodyPlain,
    required this.bodyHtml,
    required this.labels,
    this.category,
    required this.receivedAt,
  });
}

class GatekeeperResult {
  final bool isSubscription;
  final double subscriptionConfidence;
  final bool shouldExclude;
  final String? exclusionReason;
  final Map<String, dynamic> features;
  final String? unsubscribeLink;

  GatekeeperResult({
    required this.isSubscription,
    required this.subscriptionConfidence,
    required this.shouldExclude,
    this.exclusionReason,
    required this.features,
    this.unsubscribeLink,
  });
}

/// Subscription Detection Service
/// Pattern matching for newsletter identification
class SubscriptionDetector {
  // Patterns that indicate subscription emails
  static final List<RegExp> _unsubscribePatterns = [
    RegExp(r'unsubscribe', caseSensitive: false),
    RegExp(r'opt.?out', caseSensitive: false),
    RegExp(r'manage\s+preferences', caseSensitive: false),
    RegExp(r'email\s+preferences', caseSensitive: false),
    RegExp(r'update\s+subscription', caseSensitive: false),
    RegExp(r'stop\s+receiving', caseSensitive: false),
    RegExp(r'取消訂閱', caseSensitive: false),
    RegExp(r'退訂', caseSensitive: false),
  ];

  static final List<RegExp> _newsletterPatterns = [
    RegExp(r'newsletter', caseSensitive: false),
    RegExp(r'weekly\s+digest', caseSensitive: false),
    RegExp(r'daily\s+digest', caseSensitive: false),
    RegExp(r'monthly\s+update', caseSensitive: false),
    RegExp(r'subscription\s+update', caseSensitive: false),
  ];

  static final RegExp _unsubscribeLinkPattern = RegExp(
    r'href=["\']([^"\']*(?:unsubscribe|opt.?out|manage.?preferences)[^"\']*)["\']',
    caseSensitive: false,
  );

  SubscriptionResult detect(EmailInput input) {
    double confidence = 0.0;
    String? unsubscribeLink;

    // Check for unsubscribe patterns in body
    final combinedText = '${input.bodyPlain} ${input.bodyHtml}';
    for (final pattern in _unsubscribePatterns) {
      if (pattern.hasMatch(combinedText)) {
        confidence += 0.2;
      }
    }

    // Check for newsletter patterns
    final subjectAndBody = '${input.subject} $combinedText';
    for (final pattern in _newsletterPatterns) {
      if (pattern.hasMatch(subjectAndBody)) {
        confidence += 0.15;
      }
    }

    // Extract unsubscribe link
    final linkMatch = _unsubscribeLinkPattern.firstMatch(input.bodyHtml);
    if (linkMatch != null) {
      unsubscribeLink = linkMatch.group(1);
      confidence += 0.3;
    }

    // Check Gmail category
    if (input.category == 'promotions' || input.category == 'updates') {
      confidence += 0.2;
    }

    // Check List-Unsubscribe header (would be in labels)
    if (input.labels.any((l) => l.toLowerCase().contains('unsubscribe'))) {
      confidence += 0.25;
    }

    // Cap at 1.0
    confidence = confidence.clamp(0.0, 1.0);

    return SubscriptionResult(
      isSubscription: confidence >= 0.4,
      confidence: confidence,
      unsubscribeLink: unsubscribeLink,
    );
  }
}

class SubscriptionResult {
  final bool isSubscription;
  final double confidence;
  final String? unsubscribeLink;

  SubscriptionResult({
    required this.isSubscription,
    required this.confidence,
    this.unsubscribeLink,
  });
}

/// AI Judge Service
/// Uses OpenAI to determine if sender should be excluded
class AiJudgeService {
  final String openAiApiKey;
  
  AiJudgeService({required this.openAiApiKey});

  Future<ExclusionResult> shouldExclude(EmailInput input) async {
    // For now, use rule-based exclusion
    // In production, this would call OpenAI API
    
    // Obvious exclusions: receipts, confirmations, transactional
    final transactionalPatterns = [
      RegExp(r'order\s+confirm', caseSensitive: false),
      RegExp(r'shipping\s+notification', caseSensitive: false),
      RegExp(r'password\s+reset', caseSensitive: false),
      RegExp(r'verification\s+code', caseSensitive: false),
      RegExp(r'two.?factor', caseSensitive: false),
      RegExp(r'2fa\s+code', caseSensitive: false),
      RegExp(r'login\s+alert', caseSensitive: false),
    ];

    for (final pattern in transactionalPatterns) {
      if (pattern.hasMatch(input.subject)) {
        return ExclusionResult(
          exclude: true,
          reason: 'Transactional email detected',
        );
      }
    }

    return ExclusionResult(exclude: false);
  }
}

class ExclusionResult {
  final bool exclude;
  final String? reason;

  ExclusionResult({required this.exclude, this.reason});
}

/// Feature Extractor
/// Extracts ML features for XGBoost ranking
class FeatureExtractor {
  Map<String, dynamic> extract(EmailInput input) {
    return {
      'content_length': input.bodyPlain.length,
      'subject_length': input.subject.length,
      'hour_received': input.receivedAt.hour,
      'day_of_week': input.receivedAt.weekday,
      'has_images': _countImages(input.bodyHtml) > 0,
      'image_count': _countImages(input.bodyHtml),
      'link_count': _countLinks(input.bodyHtml),
      'has_unsubscribe': _hasUnsubscribe(input.bodyHtml),
      'is_reply': input.subject.toLowerCase().startsWith('re:'),
      'is_forward': input.subject.toLowerCase().startsWith('fwd:'),
      'exclamation_count': _count(input.subject, '!'),
      'question_count': _count(input.subject, '?'),
      'uppercase_ratio': _uppercaseRatio(input.subject),
      'sender_domain': _extractDomain(input.fromEmail),
    };
  }

  int _countImages(String html) {
    return RegExp(r'<img\s', caseSensitive: false).allMatches(html).length;
  }

  int _countLinks(String html) {
    return RegExp(r'<a\s+href', caseSensitive: false).allMatches(html).length;
  }

  bool _hasUnsubscribe(String html) {
    return RegExp(r'unsubscribe', caseSensitive: false).hasMatch(html);
  }

  int _count(String text, String char) {
    return text.split(char).length - 1;
  }

  double _uppercaseRatio(String text) {
    if (text.isEmpty) return 0;
    final uppercase = text.replaceAll(RegExp(r'[^A-Z]'), '').length;
    return uppercase / text.length;
  }

  String _extractDomain(String email) {
    final parts = email.split('@');
    return parts.length > 1 ? parts[1].toLowerCase() : '';
  }
}
