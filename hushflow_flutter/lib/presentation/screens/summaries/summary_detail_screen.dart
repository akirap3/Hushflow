import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryDetailScreen extends ConsumerWidget {
  final int summaryId;
  const SummaryDetailScreen({super.key, required this.summaryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Digest'),
        actions: [
          IconButton(icon: const Icon(Icons.headphones), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weekly Email Digest', style: Theme.of(context).textTheme.headlineSmall),
            Text('Dec 16 - Dec 23, 2024 • 15 emails', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('This week you received 15 subscription emails across technology news and product updates.'),
            ),
            const SizedBox(height: 24),
            Text('Key Highlights', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            ...List.generate(3, (i) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    CircleAvatar(radius: 16, child: Text(['T', 'A', 'P'][i])),
                    const SizedBox(width: 8),
                    Expanded(child: Text(['TechCrunch', 'Apple', 'Product Hunt'][i])),
                    Chip(label: Text('${95 - i * 7}%'), padding: EdgeInsets.zero),
                  ]),
                  const SizedBox(height: 8),
                  Text(['AI Report Q4', 'MacBook Pro', 'Top Products'][i], style: Theme.of(context).textTheme.titleSmall),
                  const Text('Brief summary of the email content...'),
                ]),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
