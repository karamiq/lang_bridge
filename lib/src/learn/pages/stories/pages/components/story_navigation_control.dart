import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/story_progress_tracker.dart';

/// Widget for story navigation controls
class StoryNavigationControls extends StatelessWidget {
  final StoryProgressTracker progressTracker;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onComplete;

  const StoryNavigationControls({
    super.key,
    required this.progressTracker,
    required this.onPrevious,
    required this.onNext,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: Insets.extraSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${progressTracker.currentPartIndex + 1}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                ' / ${progressTracker.totalParts}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          SizedBox(height: Insets.extraSmall),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: progressTracker.canGoPrevious() ? onPrevious : null,
                  icon: const Icon(Icons.arrow_back),
                  label: Text(context.l10n.previous_button),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: progressTracker.canGoNext() ? onNext : onComplete,
                  icon: Icon(
                    progressTracker.canGoNext() ? Icons.arrow_forward : Icons.check_circle,
                  ),
                  label: Text(
                    progressTracker.canGoNext() ? context.l10n.next_button : context.l10n.finish_button,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
