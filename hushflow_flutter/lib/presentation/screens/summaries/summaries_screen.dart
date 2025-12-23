import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class SummariesScreen extends ConsumerWidget {
  const SummariesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summaries'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.article, color: Colors.white),
              ),
              title: Text('Weekly Digest #${5 - index}'),
              subtitle: Text('${12 + index * 3} emails • ${timeago.format(DateTime.now().subtract(Duration(days: index * 7)))}'),
              trailing: index % 2 == 0 ? const Icon(Icons.headphones) : null,
              onTap: () => context.push('/summary/$index'),
            ),
          );
        },
      ),
    );
  }
}
