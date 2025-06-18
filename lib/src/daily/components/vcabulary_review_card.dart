import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/daily_models.dart';

class VocabularyReviewCard extends StatelessWidget {
  final List<VocabularyEntryModel> vocabularyBank;
  final VoidCallback onPlayAudio;
  final VoidCallback onComplete;

  const VocabularyReviewCard({
    super.key,
    required this.vocabularyBank,
    required this.onPlayAudio,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.library_books, color: colorScheme.primary, size: 24),
                SizedBox(width: 8),
                Text(
                  ' ${context.l10n.review} ${context.l10n.vocabulary}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Text(
                  '+${vocabularyBank.length} ${context.l10n.points}',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ...vocabularyBank.map((word) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        word.arabic,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '(${word.pronunciation})',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurface.withOpacity(0.6),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '- ${word.english}',
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: onPlayAudio,
                  icon: Icon(Icons.volume_up, size: 16),
                  label: Text(context.l10n.listen, style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
                Spacer(),
                //if (!isCompleted)
                ElevatedButton(
                  onPressed: onComplete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    foregroundColor: colorScheme.onSecondary,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  child: Text(context.l10n.complete, style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
