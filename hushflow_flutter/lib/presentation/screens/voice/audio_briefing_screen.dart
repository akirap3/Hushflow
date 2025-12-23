import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioBriefingScreen extends ConsumerStatefulWidget {
  const AudioBriefingScreen({super.key});

  @override
  ConsumerState<AudioBriefingScreen> createState() => _AudioBriefingScreenState();
}

class _AudioBriefingScreenState extends ConsumerState<AudioBriefingScreen> {
  bool _isPlaying = false;
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            const Spacer(),
            Container(
              width: 200, height: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ]),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.mail, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 48),
            Text('Audio Briefing', style: Theme.of(context).textTheme.headlineSmall),
            Text('5 emails • 2:30', style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            Slider(value: _progress, onChanged: (v) => setState(() => _progress = v)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('0:45'), Text('2:30')]),
            const SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(icon: const Icon(Icons.skip_previous), iconSize: 32, onPressed: () {}),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => setState(() => _isPlaying = !_isPlaying),
                child: Container(
                  width: 72, height: 72,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 32),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(icon: const Icon(Icons.skip_next), iconSize: 32, onPressed: () {}),
            ]),
            const SizedBox(height: 48),
          ]),
        ),
      ),
    );
  }
}
