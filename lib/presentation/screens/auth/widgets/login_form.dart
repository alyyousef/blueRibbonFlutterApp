import 'package:flutter/material.dart';
import 'login_button.dart';
import '../../../../core/utils/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      LoginButton.login(context, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: Validators.validateEmail,
            onSaved: (value) => _email = value ?? '',
          ),
          SizedBox(height: 12),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: Validators.validatePassword,
            onSaved: (value) => _password = value ?? '',
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => _submit(context),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
