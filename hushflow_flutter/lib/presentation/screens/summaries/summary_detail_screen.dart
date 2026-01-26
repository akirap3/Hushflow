import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushflow_client/hushflow_client.dart';
import '../../../providers/api_client_provider.dart';
import '../../../providers/auth_provider.dart';
import 'package:intl/intl.dart';

class SummaryDetailScreen extends ConsumerStatefulWidget {
  final int summaryId;
  const SummaryDetailScreen({super.key, required this.summaryId});

  @override
  ConsumerState<SummaryDetailScreen> createState() => _SummaryDetailScreenState();
}

class _SummaryDetailScreenState extends ConsumerState<SummaryDetailScreen> {
  bool _isLoading = true;
  SummaryDetails? _details;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final authState = ref.read(authStateProvider).valueOrNull;
      final accessToken = authState?.accessToken;
      
      if (accessToken == null) throw Exception('Not authenticated');

      final details = await ref.read(summaryEndpointProvider).getSummaryDetails(
        accessToken, 
        widget.summaryId // ID from mock
      );
      
      if (mounted) {
        setState(() {
          _details = details;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (_error != null) return Scaffold(appBar: AppBar(), body: Center(child: Text('Error: $_error')));
    if (_details == null) return const Scaffold(body: Center(child: Text('Not found')));

    final summary = _details!.summary;
    final items = _details!.items;
    final dateFormat = DateFormat('MMM d');

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
            Text(summary.title, style: Theme.of(context).textTheme.headlineSmall),
            Text(
              '${dateFormat.format(summary.periodStart)} - ${dateFormat.format(summary.periodEnd)} • ${summary.emailCount} emails', 
              style: Theme.of(context).textTheme.bodyMedium
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(summary.content),
            ),
            const SizedBox(height: 24),
            Text('Key Highlights', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            ...items.map((item) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 16, 
                      child: Text(item.sender.isNotEmpty ? item.sender[0].toUpperCase() : '?'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item.sender, style: const TextStyle(fontWeight: FontWeight.bold))),
                    Chip(
                      label: Text('${(item.priorityScore * 100).toInt()}%'), 
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Text(item.subject, style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(item.summaryText, maxLines: 2, overflow: TextOverflow.ellipsis),
                ]),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
