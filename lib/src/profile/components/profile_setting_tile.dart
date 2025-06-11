// widgets/profile/profile_setting_tile.dart
import 'package:flutter/material.dart';

class ProfileSettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final bool isError;

  const ProfileSettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isError ? colorScheme.errorContainer : colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isError ? colorScheme.onErrorContainer : colorScheme.onPrimaryContainer,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: trailing,
    );
  }
}
