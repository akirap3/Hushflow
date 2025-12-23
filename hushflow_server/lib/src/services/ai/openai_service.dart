import 'dart:convert';
import 'package:http/http.dart' as http;

/// OpenAI Service for summarization, vision, and voice intent
class OpenAiService {
  static const String _baseUrl = 'https://api.openai.com/v1';
  
  final String apiKey;
  final String model;
  final String visionModel;

  OpenAiService({
    required this.apiKey,
    this.model = 'gpt-4o-mini',
    this.visionModel = 'gpt-4o',
  });

  /// Summarize email content
  Future<String> summarizeEmail({
    required String sender,
    required String subject,
    required String body,
    int maxTokens = 150,
  }) async {
    final prompt = '''Summarize this email in 2-3 sentences. Focus on the key information and actionable items.

Sender: $sender
Subject: $subject

Content:
$body

Summary:''';

    return await _chatCompletion(prompt, maxTokens: maxTokens);
  }

  /// Generate a digest summary from multiple emails
  Future<String> generateDigest({
    required List<EmailSummaryInput> emails,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) async {
    final emailsText = emails.map((e) => '''
### ${e.sender}
**Subject:** ${e.subject}
**Summary:** ${e.summary}
''').join('\n');

    final prompt = '''Create a concise email digest report in markdown format.
Period: ${_formatDate(periodStart)} to ${_formatDate(periodEnd)}

Emails to include:
$emailsText

Format the digest with:
1. A brief overview (1-2 sentences)
2. Key highlights section with the most important items
3. List of all emails with sender, subject, and summary

Keep it scannable and actionable.''';

    return await _chatCompletion(prompt, maxTokens: 1000);
  }

  /// Analyze if an image is valuable for the summary
  Future<ImageAnalysisResult> analyzeImage(String imageUrl) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': visionModel,
        'messages': [
          {
            'role': 'user',
            'content': [
              {
                'type': 'text',
                'text': '''Analyze this image from an email newsletter. Determine:
1. Is this image valuable/informative (not just decoration, logo, or spacer)?
2. If valuable, provide a brief description.

Respond in JSON format:
{"valuable": true/false, "description": "..."}'''
              },
              {
                'type': 'image_url',
                'image_url': {'url': imageUrl}
              }
            ]
          }
        ],
        'max_tokens': 100,
      }),
    );

    if (response.statusCode != 200) {
      throw OpenAiException('Vision API failed: ${response.body}');
    }

    final data = jsonDecode(response.body);
    final content = data['choices'][0]['message']['content'];
    
    try {
      final result = jsonDecode(content);
      return ImageAnalysisResult(
        isValuable: result['valuable'] ?? false,
        description: result['description'],
      );
    } catch (_) {
      return ImageAnalysisResult(isValuable: false);
    }
  }

  /// Parse voice command intent
  Future<VoiceIntent> parseVoiceIntent(String transcript) async {
    final prompt = '''Parse this voice command for an email management app.
Possible intents:
- read_summary: User wants to hear their email summary
- mark_read: Mark emails as read (may specify sender or subject)
- exclude_sender: Exclude a sender from future summaries
- unsubscribe: Unsubscribe from a sender
- schedule_summary: Set summary schedule
- cleanup: Start cleanup process
- unknown: Cannot determine intent

Voice command: "$transcript"

Respond in JSON:
{"intent": "...", "entities": {"sender": "...", "time": "...", etc}}''';

    final response = await _chatCompletion(prompt, maxTokens: 100);
    
    try {
      return VoiceIntent.fromJson(jsonDecode(response));
    } catch (_) {
      return VoiceIntent(intent: 'unknown', entities: {});
    }
  }

  /// Generate TTS audio for summary (returns URL to audio file)
  Future<String> generateTts(String text) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/audio/speech'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'tts-1',
        'input': text,
        'voice': 'nova',
        'response_format': 'mp3',
      }),
    );

    if (response.statusCode != 200) {
      throw OpenAiException('TTS API failed: ${response.body}');
    }

    // In production, upload to S3/GCS and return URL
    // For now, return base64 encoded audio
    return 'data:audio/mp3;base64,${base64Encode(response.bodyBytes)}';
  }

  Future<String> _chatCompletion(String prompt, {int maxTokens = 500}) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': model,
        'messages': [
          {'role': 'user', 'content': prompt}
        ],
        'max_tokens': maxTokens,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode != 200) {
      throw OpenAiException('Chat API failed: ${response.body}');
    }

    final data = jsonDecode(response.body);
    return data['choices'][0]['message']['content'];
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }
}

class EmailSummaryInput {
  final String sender;
  final String subject;
  final String summary;
  final String? imageUrl;

  EmailSummaryInput({
    required this.sender,
    required this.subject,
    required this.summary,
    this.imageUrl,
  });
}

class ImageAnalysisResult {
  final bool isValuable;
  final String? description;

  ImageAnalysisResult({required this.isValuable, this.description});
}

class VoiceIntent {
  final String intent;
  final Map<String, dynamic> entities;

  VoiceIntent({required this.intent, required this.entities});

  factory VoiceIntent.fromJson(Map<String, dynamic> json) {
    return VoiceIntent(
      intent: json['intent'] ?? 'unknown',
      entities: json['entities'] ?? {},
    );
  }
}

class OpenAiException implements Exception {
  final String message;
  OpenAiException(this.message);
  
  @override
  String toString() => 'OpenAiException: $message';
}
