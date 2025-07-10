import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<bool>>((ref) {
  final service = ref.read(authServiceProvider);
  return AuthNotifier(service);
});

class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthService _service;

  AuthNotifier(this._service) : super(const AsyncData(false));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    final success = await _service.login(email, password);
    state = AsyncData(success);
  }
}
