import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/activities/components/game_card.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Games & activities',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Practice with interactive games',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: [
                GameCard(
                    context: context,
                    title: 'Target Practice',
                    subtitle: 'Quick translation challenges',
                    icon: Icons.gps_fixed,
                    iconColor: colorScheme.secondary),
                const SizedBox(height: 16),
                GameCard(
                    context: context,
                    title: 'Listening Practice',
                    subtitle: 'Train your ear',
                    icon: Icons.headphones,
                    iconColor: colorScheme.tertiary),
                const SizedBox(height: 16),
                GameCard(
                    context: context,
                    title: 'Writing Practice',
                    subtitle: 'Improve your writing',
                    icon: Icons.edit,
                    iconColor: colorScheme.primary),
                const SizedBox(height: 16),
                GameCard(
                    context: context,
                    title: 'Memory Game',
                    subtitle: 'Match and remember',
                    icon: Icons.shuffle,
                    iconColor: colorScheme.secondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
