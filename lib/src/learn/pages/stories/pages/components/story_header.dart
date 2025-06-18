import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/story_model.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/story_progress_tracker.dart';

/// Widget for displaying story header with metadata and progress
class StoryHeader extends StatelessWidget {
  final StoryModel story;
  final StoryProgressTracker progressTracker;

  const StoryHeader({
    super.key,
    required this.story,
    required this.progressTracker,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: story.level.color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                story.level.name(context).toLowerCase(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? colorScheme.surface : colorScheme.onSurface,
                    ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.access_time,
              size: 16,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 4),
            Text(
              context.l10n.duration_minutes_suffix(story.duration),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const Spacer(),
            Text(
              context.l10n.storyProgressPercnetage(
                progressTracker.progressPercentage,
              ),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: progressTracker.progress,
          backgroundColor: theme.colorScheme.surfaceVariant,
          valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
        ),
      ],
    );
  }
}
