import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'core/theme/app_theme.dart';
import 'presentation/router/app_router.dart';

class InboxButlerApp extends ConsumerWidget {
  const InboxButlerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: 'Inbox Butler',
      debugShowCheckedModeBanner: false,
      
      // Theme configuration using FlexColorScheme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      
      // Router configuration
      routerConfig: router,
    );
  }
}
