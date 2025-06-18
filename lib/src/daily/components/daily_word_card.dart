import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DailyWordCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String arabicWord;
  final String englishWord;
  final String pronunciation;
  final String exampleArabic;
  final String exampleEnglish;
  final int points;
  final VoidCallback onPlayAudio;
  final VoidCallback onComplete;

  const DailyWordCard({
    super.key,
    required this.arabicWord,
    required this.englishWord,
    required this.pronunciation,
    required this.exampleArabic,
    required this.exampleEnglish,
    required this.points,
    required this.onPlayAudio,
    required this.onComplete,
    required this.title,
    required this.icon,
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
                Icon(icon, color: colorScheme.primary, size: 24),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Text(
                  '$points ${context.l10n.points}',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    arabicWord,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      fontFamily: 'thuluth',
                    ),
                  ),
                  Text(
                    exampleArabic,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface.withOpacity(0.8),
                      fontStyle: FontStyle.italic,
                      fontFamily: 'thuluth',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    englishWord,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              '${context.l10n.example}:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 4),
            Text(
              exampleArabic,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurface.withOpacity(0.7),
                fontFamily: 'thuluth',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            Text(
              exampleEnglish,
              style: TextStyle(fontSize: 12, color: colorScheme.onSurface.withOpacity(0.7)),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final talk = FlutterTts();
                    await talk.setLanguage('ar');
                    await talk.speak(arabicWord);
                    await talk.awaitSpeakCompletion(true);
                    await talk.setLanguage('en');
                    await talk.speak(englishWord);
                  },
                  icon: Icon(Icons.volume_up, size: 16),
                  label: Text(context.l10n.listen, style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
                Spacer(),
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
