import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/difficulty_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart & Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1), // Indigo
          brightness: Brightness.light,
          primary: const Color(0xFF6366F1),
          secondary: const Color(0xFFEC4899), // Pink
          tertiary: const Color(0xFF10B981), // Emerald
          surface: const Color(0xFFF8FAFC),
          // ignore: deprecated_member_use
          background: const Color(0xFFF1F5F9),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6366F1),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6366F1),
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: const CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/difficulty': (context) => const DifficultyScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}
