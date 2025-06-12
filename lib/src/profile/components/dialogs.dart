import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';

class LanguageDialog extends ConsumerStatefulWidget {
  const LanguageDialog({super.key});

  @override
  ConsumerState<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends ConsumerState<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = ref.watch(settingsProvider).locale?.languageCode ?? 'en';
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        context.l10n.select,
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
    final local = context.l10n;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        local.about,
        style: TextStyle(color: colorScheme.onSurface),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(local.appName, style: TextStyle(color: colorScheme.onSurface)),
          const SizedBox(height: 8),
          Text(local.version, style: TextStyle(color: colorScheme.onSurface)),
          const SizedBox(height: 8),
          Text(local.build, style: TextStyle(color: colorScheme.onSurface)),
          const SizedBox(height: 8),
          Text(local.developer, style: TextStyle(color: colorScheme.onSurface)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(local.ok, style: TextStyle(color: colorScheme.primary)),
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
    final local = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(local.logout, style: TextStyle(color: colorScheme.onSurface)),
      content: Text(local.logoutConfirm, style: TextStyle(color: colorScheme.onSurface)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(local.cancel, style: TextStyle(color: colorScheme.primary)),
        ),
        TextButton(
          onPressed: () => ref.read(authenticationProvider.notifier).logout(),
          child: Text(local.logout, style: TextStyle(color: colorScheme.error)),
        ),
      ],
    );
  }
}
