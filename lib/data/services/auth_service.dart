class AuthService {
  static const _mockEmail = 'test@example.com';
  static const _mockPassword = 'password123';

  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return email == _mockEmail && password == _mockPassword;
  }
}
