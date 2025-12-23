# Hushflow 收件箱訂閱信件管家

An intelligent email subscription manager that acts as your personal "Gatekeeper" - providing smart summaries, filtering noise, and managing unsubscriptions.

## Features

- 🤖 **AI Summaries** - GPT-powered digest of your newsletters
- 📊 **Smart Ranking** - XGBoost ML model for personalized priority
- 🎧 **Audio Briefings** - Listen to your email summary on the go
- 🗣️ **Voice Control** - Natural language commands
- 🧹 **Cleanup Butler** - Batch unsubscribe from stale senders
- ⚡ **Real-time Sync** - Gmail webhook integration

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | Flutter + Riverpod + FlexColorScheme |
| Backend | Serverpod (Dart) |
| Database | PostgreSQL |
| Cache | Redis |
| ML | XGBoost (Python/FastAPI) |
| AI | OpenAI GPT-4 + Vision + TTS |
| Auth | Gmail OAuth2 |

## Project Structure

```
Hushflow/
├── hushflow_server/      # Serverpod backend
├── hushflow_client/      # Generated Dart client
├── hushflow_flutter/     # Flutter mobile/web app
└── .github/              # CI/CD workflows
```

## Getting Started

### Prerequisites

- Dart SDK >= 3.0.0
- Flutter >= 3.10.0
- Docker & Docker Compose
- Python 3.11+ (for ML service)

### Setup

1. **Start backend services:**
   ```bash
   cd hushflow_server
   docker compose up --build -d
   dart bin/main.dart --apply-migrations
   ```

2. **Configure secrets:**
   Edit `hushflow_server/config/passwords.yaml`:
   ```yaml
   development:
     gmailClientId: your-client-id
     gmailClientSecret: your-client-secret
     openaiApiKey: sk-...
   ```

3. **Run Flutter app:**
   ```bash
   cd hushflow_flutter
   flutter pub get
   flutter run
   ```

### Google Cloud Setup

1. Create a project in [Google Cloud Console](https://console.cloud.google.com/)
2. Enable Gmail API
3. Create OAuth 2.0 credentials
4. Setup Pub/Sub for webhooks

## Development

```bash
# Generate Serverpod code
cd hushflow_server
serverpod generate

# Run tests
dart test

# Start ML service
cd hushflow_server/ml_service
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## License

MIT
