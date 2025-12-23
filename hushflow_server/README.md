# Hushflow Server

Serverpod backend for the Hushflow email management app.

## Endpoints

- `AuthEndpoint` - Gmail OAuth flow
- `EmailEndpoint` - Email CRUD and tracking
- `SummaryEndpoint` - AI summary generation
- `CleanupEndpoint` - Batch cleanup actions
- `VoiceEndpoint` - Voice command processing

## Running

```bash
docker compose up --build -d
dart bin/main.dart --apply-migrations
```

## Development

```bash
serverpod generate
dart run bin/main.dart
```
