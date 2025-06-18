import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/story_model.dart'; // Adjust the import path

class StoryCard extends StatelessWidget {
  final StoryModel story;
  final VoidCallback? onTap;
  const StoryCard({super.key, required this.story, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  story.titleEn,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  story.titleAr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 22,
                      fontFamily: 'thuluth'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              story.descriptionEn,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              story.descriptionAr,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontFamily: 'thuluth'),
            ),
            const SizedBox(height: 16),
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
                const SizedBox(width: 8),
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 4),
                Text(context.l10n.duration_minutes_suffix(story.duration.toString())),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: onTap,
                  icon: const Icon(Icons.play_arrow),
                  label: Text(context.l10n.read_button),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
