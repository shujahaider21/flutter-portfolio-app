import 'package:flutter/material.dart';
import '../widgets/neon_background.dart';
import '../models/user.dart';
import '../theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  Widget _sectionTitle(String text, Color color) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            _sectionTitle('Education', color),
            ...demoUser.education.map(
              (e) =>
                  ListTile(leading: const Icon(Icons.school), title: Text(e)),
            ),
            const SizedBox(height: 12),
            _sectionTitle('Skills', color),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  demoUser.skills
                      .map(
                        (s) => Chip(
                          label: Text(s),
                          backgroundColor: Theme.of(context).cardColor,
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 12),
            _sectionTitle('Hobbies', color),
            ...demoUser.hobbies
                .map(
                  (h) => ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(h),
                  ),
                )
                .toList(),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Profile'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor.withOpacity(0.95),
        currentIndex: 2,
        selectedItemColor: color,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index) {
          if (index == 0)
            Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
          if (index == 1) Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}
