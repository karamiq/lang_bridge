import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/daily_progress_model.dart';

class ChallengesGrid extends StatelessWidget {
  const ChallengesGrid({
    super.key,
    required this.completedChallenges,
    required this.progress,
  });

  final List<bool> completedChallenges;
  final DailyProgressModel progress;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final challenges = [
      {'icon': Icons.school, 'title': context.l10n.words, 'points': progress.currentWord.points},
      {
        'icon': Icons.quiz,
        'title': context.l10n.quiz,
        'points': progress.currentQuizQuestion.fold<int>(0, (sum, q) => sum + q.points),
      },
      {'icon': Icons.chat, 'title': context.l10n.phrases, 'points': progress.currentPhrase.points},
      {
        'icon': Icons.library_books,
        'title': context.l10n.review,
        'points': progress.vocabularyEntries.fold<int>(0, (sum, v) => sum + v.points)
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        final challenge = challenges[index];
        final isCompleted = completedChallenges[index];

        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isCompleted ? colorScheme.primaryContainer : colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isCompleted ? colorScheme.primary : colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                challenge['icon'] as IconData,
                color: isCompleted ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.6),
                size: 20,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      challenge['title'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isCompleted
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      '+${challenge['points']} ${context.l10n.points}',
                      style: TextStyle(
                        fontSize: 10,
                        color: isCompleted
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              if (isCompleted)
                Icon(
                  Icons.check_circle,
                  color: colorScheme.onPrimaryContainer,
                  size: 30,
                ),
            ],
          ),
        );
      },
    );
  }
}
