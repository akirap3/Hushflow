import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/inbox/inbox_screen.dart';
import '../screens/inbox/email_detail_screen.dart';
import '../screens/summaries/summaries_screen.dart';
import '../screens/summaries/summary_detail_screen.dart';
import '../screens/cleanup/cleanup_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/voice/audio_briefing_screen.dart';
import '../screens/onboarding/onboarding_whitelist_screen.dart';
import '../../providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull?.isAuthenticated ?? false;
      final isLoginRoute = state.matchedLocation == '/login';
      final isOnboardingRoute = state.matchedLocation.startsWith('/onboarding');
      
      if (!isLoggedIn && !isLoginRoute) {
        return '/login';
      }
      if (isLoggedIn && isLoginRoute) {
        return '/';
      }
      return null;
    },
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      // Onboarding routes
      GoRoute(
        path: '/onboarding/whitelist',
        builder: (context, state) => const OnboardingWhitelistScreen(),
      ),
      
      // Main shell route with bottom navigation
      ShellRoute(
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: InboxScreen(),
            ),
          ),
          GoRoute(
            path: '/summaries',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SummariesScreen(),
            ),
          ),
          GoRoute(
            path: '/cleanup',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CleanupScreen(),
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsScreen(),
            ),
          ),
        ],
      ),
      
      // Detail routes
      GoRoute(
        path: '/email/:id',
        builder: (context, state) {
          final emailId = int.parse(state.pathParameters['id']!);
          return EmailDetailScreen(emailId: emailId);
        },
      ),
      GoRoute(
        path: '/summary/:id',
        builder: (context, state) {
          final summaryId = int.parse(state.pathParameters['id']!);
          return SummaryDetailScreen(summaryId: summaryId);
        },
      ),
      GoRoute(
        path: '/audio-briefing',
        builder: (context, state) => const AudioBriefingScreen(),
      ),
    ],
  );
});
