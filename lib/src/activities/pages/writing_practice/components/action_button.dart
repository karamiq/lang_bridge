// lib/widgets/action_button.dart
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isPrimary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? colorScheme.primary : colorScheme.secondary,
          foregroundColor: isPrimary ? colorScheme.onPrimary : colorScheme.onSecondary,
          disabledBackgroundColor: colorScheme.surfaceVariant,
          disabledForegroundColor: colorScheme.onSurfaceVariant,
          elevation: onPressed != null ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
