import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/listening_practice_models.dart';

class CompletionDialog extends StatelessWidget {
  final ListeningPracticePerformanceModel performance;
  final VoidCallback onConfirm;

  const CompletionDialog({
    super.key,
    required this.performance,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Gap(Insets.medium),
          Text(
            context.l10n.congratulations,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Gap(Insets.medium),
          Text(
            context.l10n.totalPoints(performance.totalPoints),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(Insets.extraLarge),
          ElevatedButton(
            onPressed: onConfirm,
            child: Text(context.l10n.ok),
          ),
        ],
      ),
    );
  }
}

class TestCompletionCard extends StatelessWidget {
  final int totalPoints;
  final VoidCallback onStartNew;

  const TestCompletionCard({
    super.key,
    required this.totalPoints,
    required this.onStartNew,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Insets.noneAll,
      child: Padding(
        padding: Insets.mediumAll,
        child: Column(
          children: [
            Icon(
              Icons.check_circle,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.testCompleted,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              context.l10n.totalPoints(totalPoints),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onStartNew,
              child: Text(context.l10n.startNewPractice),
            ),
          ],
        ),
      ),
    );
  }
}
