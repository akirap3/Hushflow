import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hushflow_client/hushflow_client.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../providers/api_client_provider.dart';

class SummariesScreen extends ConsumerStatefulWidget {
  const SummariesScreen({super.key});

  @override
  ConsumerState<SummariesScreen> createState() => _SummariesScreenState();
}

class _SummariesScreenState extends ConsumerState<SummariesScreen> {
  bool _isLoading = true;
  List<Summary> _summaries = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSummaries();
  }

  Future<void> _loadSummaries() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      // TODO: Get real userId
      final summaries = await ref.read(summaryEndpointProvider).listSummaries(1);
      if (mounted) {
        setState(() {
          _summaries = summaries;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summaries'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : _error != null 
              ? Center(child: Text('Error: $_error'))
              : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _summaries.length,
        itemBuilder: (context, index) {
          final summary = _summaries[index];
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
              title: Text(summary.title),
              subtitle: Text('${summary.emailCount} emails • ${summary.generatedAt.toLocal().toString().split('.')[0]}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                 if (summary.id != null) {
                    context.push('/summary/${summary.id}');
                 }
              },
            ),
          );
        },
      ),
    );
  }
}
