import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';

class LeaderboardItem extends ConsumerWidget {
  const LeaderboardItem({
    super.key,
    required this.index,
    required this.user,
  });

  final int index;
  final AuthenticationModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rank = index + 1;
    final isCurrentUser = ref.read(authenticationProvider)!.uid == user.uid;

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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrentUser ? context.colorScheme.primary : context.colorScheme.outline.withOpacity(0.2),
          width: isCurrentUser ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isCurrentUser ? context.colorScheme.primary : context.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$rank',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCurrentUser ? context.colorScheme.onPrimary : context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: context.colorScheme.primary.withOpacity(0.1),
            child: Text(
              getInitials(user.fullName),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Name and details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.w600,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: context.colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${user.points} points',
                      style: TextStyle(
                        fontSize: 12,
                        color: context.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    if (user.streak > 0) ...[
                      const SizedBox(width: 12),
                      Icon(
                        Icons.local_fire_department,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${user.streak}',
                        style: TextStyle(
                          fontSize: 12,
                          color: context.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
