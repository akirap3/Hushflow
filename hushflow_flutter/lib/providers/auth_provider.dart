import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Auth state
class AuthState {
  final bool isAuthenticated;
  final String? email;
  final String? accessToken;
  final DateTime? tokenExpiresAt;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.email,
    this.accessToken,
    this.tokenExpiresAt,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? email,
    String? accessToken,
    DateTime? tokenExpiresAt,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      tokenExpiresAt: tokenExpiresAt ?? this.tokenExpiresAt,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Auth state provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<AuthState>>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final _storage = const FlutterSecureStorage();
  
  AuthNotifier() : super(const AsyncValue.loading()) {
    _loadStoredAuth();
  }

  Future<void> _loadStoredAuth() async {
    try {
      final accessToken = await _storage.read(key: 'access_token');
      final email = await _storage.read(key: 'email');
      final expiresAtStr = await _storage.read(key: 'token_expires_at');
      
      if (accessToken != null && email != null) {
        final expiresAt = expiresAtStr != null 
            ? DateTime.parse(expiresAtStr) 
            : null;
        
        // Check if token is expired
        if (expiresAt != null && expiresAt.isBefore(DateTime.now())) {
          // Token expired, need to refresh
          state = const AsyncValue.data(AuthState(isAuthenticated: false));
        } else {
          state = AsyncValue.data(AuthState(
            isAuthenticated: true,
            email: email,
            accessToken: accessToken,
            tokenExpiresAt: expiresAt,
          ));
        }
      } else {
        state = const AsyncValue.data(AuthState(isAuthenticated: false));
      }
    } catch (e) {
      state = const AsyncValue.data(AuthState(isAuthenticated: false));
    }
  }

  Future<void> signIn({
    required String email,
    required String accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      // Store tokens securely
      await _storage.write(key: 'access_token', value: accessToken);
      await _storage.write(key: 'email', value: email);
      if (refreshToken != null) {
        await _storage.write(key: 'refresh_token', value: refreshToken);
      }
      if (tokenExpiresAt != null) {
        await _storage.write(
          key: 'token_expires_at',
          value: tokenExpiresAt.toIso8601String(),
        );
      }

      state = AsyncValue.data(AuthState(
        isAuthenticated: true,
        email: email,
        accessToken: accessToken,
        tokenExpiresAt: tokenExpiresAt,
      ));
    } catch (e) {
      state = AsyncValue.data(AuthState(
        isAuthenticated: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> signOut() async {
    await _storage.deleteAll();
    state = const AsyncValue.data(AuthState(isAuthenticated: false));
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) {
      await signOut();
      return;
    }

    // TODO: Call server to refresh token
  }
}

/// Current user email
final currentUserEmailProvider = Provider<String?>((ref) {
  return ref.watch(authStateProvider).valueOrNull?.email;
});

/// Current access token
final accessTokenProvider = Provider<String?>((ref) {
  return ref.watch(authStateProvider).valueOrNull?.accessToken;
});
