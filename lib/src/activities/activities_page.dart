import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/activities/components/game_card.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            context.l10n.gamesActivities,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.practiceWithGames,
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
                  title: context.l10n.targetPracticeTitle,
                  subtitle: context.l10n.targetPracticeSubtitle,
                  icon: Icons.gps_fixed,
                  iconColor: colorScheme.secondary,
                  onTap: () {
                    context.push('/target-practice');
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: context.l10n.listeningPracticeTitle,
                  subtitle: context.l10n.listeningPracticeSubtitle,
                  icon: Icons.headphones,
                  iconColor: colorScheme.tertiary,
                  onTap: () {
                    context.push('/listening-practice');
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: context.l10n.writingPracticeTitle,
                  subtitle: context.l10n.writingPracticeSubtitle,
                  icon: Icons.edit,
                  iconColor: colorScheme.primary,
                  onTap: () {
                    context.push('/writing-practice');
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: context.l10n.memoryGameTitle,
                  subtitle: context.l10n.memoryGameSubtitle,
                  icon: Icons.shuffle,
                  iconColor: colorScheme.secondary,
                  onTap: () {
                    context.push('${RoutesDocument.activities}${RoutesDocument.memeoryGame}');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
