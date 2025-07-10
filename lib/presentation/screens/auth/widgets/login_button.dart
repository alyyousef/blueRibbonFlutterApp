import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/auth_provider.dart';

class LoginButton {
  static void login(BuildContext context, String email, String password) {
    final container = ProviderScope.containerOf(context, listen: false);
    final auth = container.read(authProvider.notifier);

    auth.login(email, password).then((_) {
      final state = container.read(authProvider);
      if (state.value == true) {
        Navigator.pushReplacementNamed(context, '/restaurants');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    });
  }
}
