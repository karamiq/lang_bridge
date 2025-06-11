import 'package:flutter/material.dart';

class ProfileActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isError = textColor == colorScheme.error;

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
          color: textColor ?? colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
    );
  }
}
