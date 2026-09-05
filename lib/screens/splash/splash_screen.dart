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
        child: Column(
          children: [
            // Pushes the logo block down to roughly the upper-middle of
            // the screen, matching the reference layout.
            const Spacer(flex: 5),

            // LANDER logo mark (orange hexagon/network graphic).
            Image.asset(
              'assets/images/lander_logo.jpg',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            const Text(
              AppConstants.appName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppConstants.tagline,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
            ),

            // Long stretch of empty space before the "from Parm" mark,
            // which sits close to the bottom edge rather than centered.
            const Spacer(flex: 7),

            Text(
              'from',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 6),
            // The source PNG is a white-on-transparent wordmark, so it is
            // tinted here to stay visible on the white splash background.
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                AppColors.darkGray,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/parm_logo.png',
                height: 26,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
