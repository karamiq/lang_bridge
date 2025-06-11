// widgets/profile/stat_item.dart
import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String label;
  final String value;

  const StatItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
