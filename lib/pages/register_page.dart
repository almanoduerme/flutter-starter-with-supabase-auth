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
  // Get auth service
  final authService = AuthService();

  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Sign up button pressed
  void signUp() async {
    // Prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Check password
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

        // Verificación específica para errores comunes
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
              errorMessage =
                  e.message; // Usar el mensaje del error si es desconocido
          }
        } else {
          errorMessage = "Something went wrong. Please try again.";
        }

        // Mostrar el error usando el componente ErrorDialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(message: errorMessage); // Componente de error
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
          // Email
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          // Password
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          // Confirm Password
          TextField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(labelText: "Confirm password"),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          // Button
          ElevatedButton(onPressed: signUp, child: const Text("Register")),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
