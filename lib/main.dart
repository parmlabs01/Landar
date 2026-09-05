import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'core/constants.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const LanderApp());
}

class LanderApp extends StatelessWidget {
  const LanderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
