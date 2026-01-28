import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../models/user_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, UserModel?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<UserModel?> {
  AuthNotifier() : super(null);

  final _dio = Dio(BaseOptions(baseUrl: 'YOUR_BACKEND_URL'));

  Future<void> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Save JWT to secure storage here (shared_preferences or flutter_secure_storage)
        state = UserModel.fromJson(response.data['user']);
      }
    } catch (e) {
      // Handle error (show snackbar or throw)
      rethrow;
    }
  }

  void logout() {
    state = null;
    // Clear tokens from storage
  }
}
