import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/activities/components/game_card/game_card.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Scaffold(
      body: Padding(
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
                    title: context.l10n.memoryGameTitle,
                    icon: Icons.shuffle,
                    iconColor: colorScheme.tertiary,
                    onTap: () {
                      context.push('${RoutesDocument.activities}${RoutesDocument.memeoryGame}');
                    },
                  ),
                  const SizedBox(height: 16),
                  GameCard(
                    title: context.l10n.listeningPracticeTitle,
                    icon: Icons.headphones,
                    iconColor: Colors.blueAccent,
                    onTap: () {
                      context.push(RoutesDocument.activities + RoutesDocument.listeningPractice);
                    },
                  ),
                  const Gap(Insets.medium),
                  GameCard(
                    title: context.l10n.targetPracticeTitle,
                    isLocked: true,
                    icon: Icons.gps_fixed,
                    iconColor: colorScheme.secondary,
                    onTap: () {
                      context.push(RoutesDocument.activities + RoutesDocument.target);
                    },
                  ),
                  const Gap(Insets.medium),
                  GameCard(
                    title: context.l10n.writingPracticeTitle,
                    isEnabled: false,
                    icon: Icons.edit,
                    iconColor: colorScheme.surface,
                    onTap: () {
                      context.push(RoutesDocument.activities + RoutesDocument.writingPractice);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
