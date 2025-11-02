import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/neon_background.dart';
import '../models/user.dart';
import '../theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String instagramUrl = 'https://www.instagram.com/shujahaiderr';
  static const String githubUrl = 'https://github.com/shujahaider21';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/shuja-haider-03b1ab389/';
  Widget _detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white70),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the link.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error opening link: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: ThemeNotifier.themeMode,
            builder: (context, mode, _) {
              return IconButton(
                tooltip: 'Toggle Theme',
                icon: Icon(
                  mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
                ),
                onPressed: () => ThemeNotifier.toggle(),
              );
            },
          ),
        ],
      ),
      body: NeonBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.28),
                      blurRadius: 24,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('images/pfp.jpg'),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                demoUser.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accent,
                ),
              ),
              const SizedBox(height: 6),
              Text(demoUser.profession),
              const SizedBox(height: 12),
              Text(
                demoUser.bio,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 18),

              Card(
                color: Theme.of(context).cardColor.withOpacity(0.95),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Column(
                    children: [
                      _detailRow(Icons.email, demoUser.email),
                      const Divider(color: Colors.white12),
                      _detailRow(Icons.phone, demoUser.phone),
                      const Divider(color: Colors.white12),
                      _detailRow(Icons.location_on, demoUser.location),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () => _launchUrl(context, instagramUrl),
                    icon: const Icon(Icons.camera_alt_outlined, size: 18),
                    label: const Text('Instagram'),
                    style: TextButton.styleFrom(
                      foregroundColor: accent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      minimumSize: const Size(0, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const SizedBox(width: 2),

                  TextButton.icon(
                    onPressed: () => _launchUrl(context, githubUrl),
                    icon: const Icon(Icons.code, size: 18),
                    label: const Text('GitHub'),
                    style: TextButton.styleFrom(
                      foregroundColor: accent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      minimumSize: const Size(0, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const SizedBox(width: 2),

                  TextButton.icon(
                    onPressed: () => _launchUrl(context, linkedinUrl),
                    icon: const Icon(Icons.business, size: 18),
                    label: const Text('LinkedIn'),
                    style: TextButton.styleFrom(
                      foregroundColor: accent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      minimumSize: const Size(0, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),
              // const Text(
              //   'Use bottom bar to switch screens',
              //   style: TextStyle(color: Colors.white54),
              // ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor.withOpacity(0.95),
        currentIndex: 1,
        selectedItemColor: accent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
          }
          if (index == 2) Navigator.pushNamed(context, '/about');
        },
      ),
    );
  }
}
