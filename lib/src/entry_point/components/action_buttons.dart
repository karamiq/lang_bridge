import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/entry_point/components/action_button_card.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionButtonCard(
              context: context,
              icon: Icons.emoji_events,
              label: 'Leaderboard',
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.secondary,
                  context.colorScheme.secondary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ActionButtonCard(
              context: context,
              icon: Icons.menu_book,
              label: 'Courses',
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary,
                  context.colorScheme.primary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ActionButtonCard(
              context: context,
              icon: Icons.person,
              label: 'Profile',
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.tertiary,
                  context.colorScheme.tertiary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
      ],
    );
  }
}
