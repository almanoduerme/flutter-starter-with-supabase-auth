import 'package:flutter_application_8/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/error_dialog.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Get auth service
  final authService = AuthService();

  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login button pressed
  void login() async {
    // Prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // Attempt login
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        String errorMessage = "An unexpected error occurred";

        // Aquí verificamos el tipo de error y extraemos el mensaje adecuado
        if (e is AuthException) {
          // Si el error es un AuthException, podemos manejarlo de manera más específica
          switch (e.message) {
            case 'user-not-found':
              errorMessage = "User not found. Please check your email.";
              break;
            case 'wrong-password':
              errorMessage = "Incorrect password. Please try again.";
              break;
            case 'network-request-failed':
              errorMessage = "Network error. Please check your connection.";
              break;
            default:
              errorMessage =
                  e.message; // Usar el mensaje del error si es desconocido
          }
        } else {
          // Si no es un AuthException, mostramos un error genérico
          errorMessage = "Something went wrong. Please try again.";
        }

        // Muestra el ErrorDialog personalizado con el mensaje de error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(message: errorMessage); // Usa el componente aquí
          },
        );
      }
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
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
          const SizedBox(height: 12),
          // Button
          ElevatedButton(onPressed: login, child: const Text("Login")),
          const SizedBox(height: 12),
          // Go to register page to sign up
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            ),
            child: const Center(
              child: Text("Don't have an account? Sign up!"),
            ),
          ),
        ],
      ),
    );
  }
}
