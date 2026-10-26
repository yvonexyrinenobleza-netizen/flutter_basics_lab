
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const ThemeDemoApp());
}

class ThemeDemoApp extends StatefulWidget {
  const ThemeDemoApp({super.key});

  @override
  State<ThemeDemoApp> createState() => _ThemeDemoAppState();
}

class _ThemeDemoAppState extends State<ThemeDemoApp> {
  bool _isDark = false;

  void _setDark(bool value) {
    setState(() {
      _isDark = value;
    });
  }

  ThemeData buildTheme(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      colorSchemeSeed: studentColor,
      useMaterial3: true,
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: SettingsPage(
        isDark: _isDark,
        onDarkChanged: _setDark,
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onDarkChanged;

  const SettingsPage({
    super.key,
    required this.isDark,
    required this.onDarkChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 5 - Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            studentName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Profile card
          Card(
            child: const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text('My Profile'),
              subtitle: Text('BS Information Technology'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            'Appearance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark mode'),
            subtitle: const Text('Switch between light and dark theme'),
            value: isDark,
            onChanged: onDarkChanged,
          ),

          const SizedBox(height: 12),
          const Text(
            'My Skills',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              Chip(
                avatar: Icon(Icons.code),
                label: Text('Dart'),
              ),
              Chip(
                avatar: Icon(Icons.phone_android),
                label: Text('Flutter'),
              ),
              Chip(
                avatar: Icon(Icons.storage),
                label: Text('MySQL'),
              ),
              Chip(
                avatar: Icon(Icons.terminal),
                label: Text('Python'),
              ),
              Chip(
                avatar: Icon(Icons.source),
                label: Text('Git'),
              ),
              // Additional skill chip
              Chip(
                avatar: Icon(Icons.computer),
                label: Text('Java'),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            'Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings saved successfully!'),
                ),
              );
            },
            icon: const Icon(Icons.save),
            label: const Text('Save'),
          ),

          const SizedBox(height: 8),

          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Edit profile selected'),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text('Edit Profile'),
          ),

          const SizedBox(height: 8),

          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Help selected'),
                ),
              );
            },
            icon: const Icon(Icons.help_outline),
            label: const Text('Help'),
          ),
        ],
      ),
    );
  }
}
