import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';

class LanguageDialog extends ConsumerStatefulWidget {
  const LanguageDialog({super.key});

  @override
  ConsumerState<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends ConsumerState<LanguageDialog> {
  String selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        'Select Language',
        style: TextStyle(color: colorScheme.onSurface),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'English',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            leading: Radio<String>(
              value: 'en',
              groupValue: selectedLanguage,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setLocale(Locale(value ?? ''));
                Navigator.pop(context);
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'العربية',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            leading: Radio<String>(
              value: 'ar',
              groupValue: selectedLanguage,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setLocale(Locale(value ?? ''));
                Navigator.pop(context);
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        'About',
        style: TextStyle(color: colorScheme.onSurface),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Name: MyProfile',
            style: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'Version: 1.0.0',
            style: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'Build: 100',
            style: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'Developer: Your Company',
            style: TextStyle(color: colorScheme.onSurface),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'OK',
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class LogoutDialog extends ConsumerWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        'Logout',
        style: TextStyle(color: colorScheme.onSurface),
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: TextStyle(color: colorScheme.onSurface),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
        TextButton(
          onPressed: () => ref.read(authenticationProvider.notifier).logout(),
          child: Text(
            'Logout',
            style: TextStyle(color: colorScheme.error),
          ),
        ),
      ],
    );
  }
}
