import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Home screen with bottom navigation shell
class HomeScreen extends ConsumerStatefulWidget {
  final Widget child;
  
  const HomeScreen({super.key, required this.child});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.inbox_outlined),
      selectedIcon: Icon(Icons.inbox),
      label: 'Inbox',
    ),
    NavigationDestination(
      icon: Icon(Icons.article_outlined),
      selectedIcon: Icon(Icons.article),
      label: 'Summaries',
    ),
    NavigationDestination(
      icon: Icon(Icons.cleaning_services_outlined),
      selectedIcon: Icon(Icons.cleaning_services),
      label: 'Cleanup',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  final _routes = ['/', '/summaries', '/cleanup', '/settings'];

  void _onDestinationSelected(int index) {
    setState(() => _currentIndex = index);
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final newIndex = _routes.indexOf(location);
    if (newIndex != -1 && newIndex != _currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _currentIndex = newIndex);
      });
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: _destinations,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showVoiceCommandSheet(),
        child: const Icon(Icons.mic),
      ),
    );
  }

  void _showVoiceCommandSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const VoiceCommandSheet(),
    );
  }
}

class VoiceCommandSheet extends ConsumerStatefulWidget {
  const VoiceCommandSheet({super.key});

  @override
  ConsumerState<VoiceCommandSheet> createState() => _VoiceCommandSheetState();
}

class _VoiceCommandSheetState extends ConsumerState<VoiceCommandSheet> {
  bool _isListening = false;
  String _transcript = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text('Voice Command', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Say something like "Read my summary" or "Exclude newsletters"',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTapDown: (_) => _startListening(),
            onTapUp: (_) => _stopListening(),
            onTapCancel: () => _stopListening(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isListening ? 100 : 80,
              height: _isListening ? 100 : 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isListening 
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                _isListening ? Icons.mic_off : Icons.mic,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 32,
              ),
            ),
          ),
          if (_transcript.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(_transcript, textAlign: TextAlign.center),
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _startListening() => setState(() => _isListening = true);
  void _stopListening() => setState(() => _isListening = false);
}
