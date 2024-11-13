import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../auth/auth_service.dart';
import '../components/error_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords don't match!")));
      return;
    }

    try {
      await authService.signUpWithEmailPassword(email, password);
      // Ignore context issue here
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        String errorMessage = "An unexpected error occurred";

        if (e is AuthException) {
          switch (e.message) {
            case 'email-already-in-use':
              errorMessage = "The email is already in use. Please try another.";
              break;
            case 'weak-password':
              errorMessage =
                  "Your password is too weak. Please use a stronger one.";
              break;
            case 'invalid-email':
              errorMessage =
                  "The email address is invalid. Please enter a valid email.";
              break;
            default:
              errorMessage = e.message;
          }
        } else {
          errorMessage = "Something went wrong. Please try again.";
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(message: errorMessage);
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          TextField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(labelText: "Confirm password"),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: signUp, child: const Text("Register")),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
