import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/home_screen.dart';
import 'pages/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await dotenv.load(fileName: ".env");
    
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? dotenv.env['SUPABASE_ANNON_KEY']!, 
    );
  } catch (e) {
    debugPrint("Gagal inisialisasi Supabase: $e");
  }

  runApp(const ScholarshipApp());
}

class ScholarshipApp extends StatefulWidget {
  const ScholarshipApp({super.key});

  @override
  State<ScholarshipApp> createState() => _ScholarshipAppState();
}

class _ScholarshipAppState extends State<ScholarshipApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scholarship Management',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
      ),
      themeMode: _themeMode,
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          final session = snapshot.data?.session;
          if (session != null) {
            return HomeScreen(onThemeChanged: _toggleTheme);
          } else {
            return LoginScreen(toggleTheme: _toggleTheme);
          }
        },
      ),
    );
  }
}