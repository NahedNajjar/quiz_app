import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '/core/constants/theme/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Appearance
          const _SectionTitle(title: 'Appearance'),
          SwitchListTile(
            secondary: const Icon(
              Icons.dark_mode_outlined,
              color: AppColors.primary,
            ),
            title: const Text('Dark Mode'),
            value: themeProvider.isDark,
            activeColor: AppColors.primary,
            onChanged: (val) {
              themeProvider.toggleTheme(val);
            },
          ),

          // Notifications
          const _SectionTitle(title: 'Notifications'),
          SwitchListTile(
            secondary: const Icon(
              Icons.notifications_outlined,
              color: AppColors.primary,
            ),
            title: const Text('Enable Notifications'),
            value: _notifications,
            activeColor: AppColors.primary,
            onChanged: (val) => setState(() => _notifications = val),
          ),

          // Language
          const _SectionTitle(title: 'Language'),
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.primary),
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _language,
              underline: const SizedBox(),
              items: ['English', 'Arabic']
                  .map(
                    (lang) => DropdownMenuItem(value: lang, child: Text(lang)),
                  )
                  .toList(),
              onChanged: (val) => setState(() => _language = val!),
            ),
          ),

          // About
          const _SectionTitle(title: 'About'),
          const ListTile(
            leading: Icon(Icons.info_outline, color: AppColors.primary),
            title: Text('Version'),
            trailing: Text(
              '1.0.0',
              style: TextStyle(color: AppColors.textGrey),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
