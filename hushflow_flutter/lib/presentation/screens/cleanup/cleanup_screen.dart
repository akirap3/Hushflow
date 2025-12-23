import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleanupScreen extends ConsumerStatefulWidget {
  const CleanupScreen({super.key});

  @override
  ConsumerState<CleanupScreen> createState() => _CleanupScreenState();
}

class _CleanupScreenState extends ConsumerState<CleanupScreen> {
  final Set<int> _selectedIds = {};
  bool _selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleanup Butler'),
        actions: [
          if (_selectedIds.isNotEmpty)
            TextButton.icon(
              onPressed: () => setState(() { _selectedIds.clear(); _selectAll = false; }),
              icon: const Icon(Icons.close),
              label: Text('${_selectedIds.length} selected'),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.errorContainer,
                Theme.of(context).colorScheme.tertiaryContainer,
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.error.withOpacity(0.2),
                radius: 32,
                child: Text('23', style: Theme.of(context).textTheme.headlineMedium),
              ),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Unread for 30+ days', style: Theme.of(context).textTheme.titleMedium),
                Text('These emails might need attention', style: Theme.of(context).textTheme.bodySmall),
              ])),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              Checkbox(value: _selectAll, onChanged: (v) => setState(() {
                _selectAll = v ?? false;
                _selectAll ? _selectedIds.addAll(List.generate(10, (i) => i)) : _selectedIds.clear();
              })),
              const Text('Select all'),
              const Spacer(),
              Text('${_selectedIds.length} of 10 selected'),
            ]),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final isSelected = _selectedIds.contains(index);
                return ListTile(
                  onTap: () => setState(() {
                    isSelected ? _selectedIds.remove(index) : _selectedIds.add(index);
                    _selectAll = _selectedIds.length == 10;
                  }),
                  leading: Checkbox(value: isSelected, onChanged: (_) {}),
                  title: Text('Newsletter ${index + 1}'),
                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Weekly update #${100 - index}'),
                    Row(children: [
                      Icon(Icons.access_time, size: 12, color: Theme.of(context).colorScheme.error),
                      const SizedBox(width: 4),
                      Text('${30 + index * 5} days ago', style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12)),
                    ]),
                  ]),
                  isThreeLine: true,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _selectedIds.isNotEmpty ? SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () => _handleAction('trash'), icon: const Icon(Icons.delete), label: const Text('Trash'))),
            const SizedBox(width: 8),
            Expanded(child: OutlinedButton.icon(onPressed: () => _handleAction('spam'), icon: const Icon(Icons.report), label: const Text('Spam'))),
            const SizedBox(width: 8),
            Expanded(child: FilledButton.icon(onPressed: () => _handleAction('unsub'), icon: const Icon(Icons.notifications_off), label: const Text('Unsub'))),
          ]),
        ),
      ) : null,
    );
  }

  void _handleAction(String action) {
    final count = _selectedIds.length;
    setState(() { _selectedIds.clear(); _selectAll = false; });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$action: $count emails')));
  }
}
