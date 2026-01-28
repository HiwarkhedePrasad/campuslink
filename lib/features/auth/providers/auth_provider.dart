import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/supabase_client.dart';

// Stream provider for auth state changes
final authStateProvider = StreamProvider<AuthState>((ref) {
  return SupabaseConfig.client.auth.onAuthStateChange;
});

// Service provider for auth actions
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  Future<AuthResponse> signIn(String email, String password) async {
    return await SupabaseConfig.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await SupabaseConfig.client.auth.signOut();
  }
}
