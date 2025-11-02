import 'package:flutter/material.dart';
import '../widgets/neon_background.dart';
import '../widgets/neon_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _enterApp(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/home');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'to My Profile',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 28),
                NeonButton(
                  text: 'Enter App',
                  onPressed: () => _enterApp(context),
                ),
                const SizedBox(height: 14),
                Text(
                  'Sleek • Modern • Theme Toggle',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
