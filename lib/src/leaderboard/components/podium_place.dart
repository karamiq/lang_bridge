import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';

class PodiumPlace extends StatelessWidget {
  const PodiumPlace({
    super.key,
    required this.context,
    required this.position,
    required this.user,
    required this.height,
  });

  final BuildContext context;
  final int position;
  final AuthenticationModel user;
  final double height;

  @override
  Widget build(BuildContext context) {
    Color podiumColor = position == 1
        ? const Color(0xFFFFD700)
        : position == 2
            ? const Color(0xFFC0C0C0)
            : const Color(0xFFCD7F32);

    // Get initials from full name
    String getInitials(String fullName) {
      final names = fullName.trim().split(' ');
      if (names.length >= 2) {
        return names[0][0].toUpperCase() + names[1][0].toUpperCase();
      } else if (names.isNotEmpty) {
        return names[0].substring(0, 2).toUpperCase();
      }
      return 'U';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.surface,
            border: Border.all(color: podiumColor, width: 3),
          ),
          child: Center(
            child: Text(
              getInitials(user.fullName),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.fullName.split(' ').first,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onPrimary,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${user.points} ${context.l10n.points}',
          style: TextStyle(
            fontSize: 10,
            color: context.colorScheme.onPrimary.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: height / 2,
          decoration: BoxDecoration(
            color: podiumColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              '$position',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
