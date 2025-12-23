import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailDetailScreen extends ConsumerWidget {
  final int emailId;
  const EmailDetailScreen({super.key, required this.emailId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.visibility_off), onPressed: () {}, tooltip: 'Exclude'),
          IconButton(icon: const Icon(Icons.delete), onPressed: () {}, tooltip: 'Delete'),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'unsubscribe', child: Row(children: [Icon(Icons.notifications_off), SizedBox(width: 12), Text('Unsubscribe')])),
              const PopupMenuItem(value: 'spam', child: Row(children: [Icon(Icons.report), SizedBox(width: 12), Text('Mark as spam')])),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Subject Line', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Row(children: [
              const CircleAvatar(child: Text('S')),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Sender Name', style: Theme.of(context).textTheme.titleMedium),
                Text('sender@example.com', style: Theme.of(context).textTheme.bodySmall),
              ])),
              Text('Dec 23, 2024', style: Theme.of(context).textTheme.bodySmall),
            ]),
            const Divider(height: 32),
            const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.visibility_off), label: const Text('Exclude'))),
            const SizedBox(width: 12),
            Expanded(child: FilledButton.icon(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.check), label: const Text('Mark Read'))),
          ]),
        ),
      ),
    );
  }
}
