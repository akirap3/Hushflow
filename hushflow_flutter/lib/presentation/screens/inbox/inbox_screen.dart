import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  bool _showSubscriptionsOnly = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        actions: [
          IconButton(
            icon: Icon(_showSubscriptionsOnly ? Icons.mark_email_read : Icons.mail),
            onPressed: () => setState(() => _showSubscriptionsOnly = !_showSubscriptionsOnly),
          ),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _PriorityBanner(highPriorityCount: 5, onTap: () {})),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _EmailTile(
                  sender: 'Sender $index',
                  subject: 'Email subject line $index',
                  snippet: 'This is a preview of the email content...',
                  receivedAt: DateTime.now().subtract(Duration(hours: index * 2)),
                  isRead: index % 3 == 0,
                  isSubscription: index % 2 == 0,
                  priorityScore: 1.0 - (index * 0.1),
                  onTap: () => context.push('/email/$index'),
                  onExclude: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PriorityBanner extends StatelessWidget {
  final int highPriorityCount;
  final VoidCallback onTap;

  const _PriorityBanner({required this.highPriorityCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (highPriorityCount == 0) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text('$highPriorityCount', style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('High Priority', style: Theme.of(context).textTheme.titleMedium),
                    Text('Important emails based on your activity', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailTile extends StatelessWidget {
  final String sender, subject, snippet;
  final DateTime receivedAt;
  final bool isRead, isSubscription;
  final double priorityScore;
  final VoidCallback onTap, onExclude;

  const _EmailTile({
    required this.sender, required this.subject, required this.snippet,
    required this.receivedAt, required this.isRead, required this.isSubscription,
    required this.priorityScore, required this.onTap, required this.onExclude,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(sender + subject),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.visibility_off),
      ),
      confirmDismiss: (_) async { onExclude(); return false; },
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(child: Text(sender.isNotEmpty ? sender[0] : '?')),
        title: Row(
          children: [
            Expanded(child: Text(sender, style: TextStyle(fontWeight: isRead ? FontWeight.normal : FontWeight.bold))),
            Text(timeago.format(receivedAt), style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(snippet, maxLines: 1, style: Theme.of(context).textTheme.bodySmall),
            Row(
              children: [
                if (isSubscription) Chip(label: const Text('Newsletter'), padding: EdgeInsets.zero, visualDensity: VisualDensity.compact),
                const SizedBox(width: 8),
                Icon(Icons.trending_up, size: 12, color: priorityScore > 0.7 ? Colors.green : Colors.grey),
                Text('${(priorityScore * 100).toInt()}%', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
