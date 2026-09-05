import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/home/home_shell.dart';
import '../screens/profile/profile_screen.dart';

/// Centralized named routes for the app.
///
/// Screens that require constructor arguments (e.g. JobDetailScreen,
/// CourseDetailScreen) are navigated to directly via MaterialPageRoute
/// rather than through this table, since named routes don't carry
/// typed arguments cleanly.
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        login: (_) => const LoginScreen(),
        signup: (_) => const SignupScreen(),
        home: (_) => const HomeShell(),
        profile: (_) => const ProfileScreen(),
      };
}
