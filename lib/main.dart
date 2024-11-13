import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/auth_gate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  String anonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  String url = dotenv.env['SUPABASE_URL'] ?? '';

  // supabase setup
  await Supabase.initialize(
    anonKey: anonKey,
    url: url,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
      ),
      home: const AuthGate(),
    );
  }
}
