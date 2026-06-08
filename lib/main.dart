import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/theme/theme.dart';
import 'core/constants/theme/theme_provider.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/dashboard_screen.dart';
import 'screens/quiz/quiz_details_screen.dart';
import 'screens/quiz/quiz_screen.dart';
import 'screens/result/result_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/settings/settings_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/quiz-details': (context) => const QuizDetailsScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/result': (context) => const ResultScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
