import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/theme.dart';
import '../auth/login_screen.dart';

/// Splash screen.
/// - Center: LANDER logo mark (orange hexagon network graphic).
/// - Bottom: "Powered by" + Parm wordmark, positioned the same way
///   Instagram shows the small "from Meta" wordmark on its splash screen.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // LANDER logo mark (orange hexagon/network graphic).
              Image.asset(
                'assets/images/lander_logo.jpg',
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),

              const Text(
                AppConstants.appName,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppConstants.tagline,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(flex: 4),

              // "Powered by Parm" -- same treatment Instagram gives the
              // "from Meta" wordmark at the bottom of its splash screen:
              // small, muted, centered.
              Text(
                AppConstants.poweredBy,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade400,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              // The source PNG is a white-on-transparent wordmark, so it is
              // tinted dark gray here (via BlendMode.srcIn) to stay visible
              // on the white splash background.
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.grey.shade700,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  'assets/images/parm_logo.png',
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
