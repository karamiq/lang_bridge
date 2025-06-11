import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: colorScheme.onPrimaryContainer,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
