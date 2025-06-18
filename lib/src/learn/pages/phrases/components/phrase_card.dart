import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/src/learn/pages/phrases/components/language_section.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PhraseCard extends StatelessWidget {
  final CategorynModel phrase;

  const PhraseCard({
    super.key,
    required this.phrase,
  });

  void _playAudio(BuildContext context, String text, String language) {
    final flutterTts = FlutterTts();
    flutterTts.setLanguage(language);
    HapticFeedback.lightImpact();
    flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: Insets.mediumAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LanguageSection(
              language: 'English',
              text: phrase.english,
              pronunciation: phrase.englishPronunciation,
              icon: Icons.language,
              isArabic: false,
              onPlayAudio: () => _playAudio(context, phrase.english, 'en'),
            ),

            const SizedBox(height: 20),

            // Arabic Section
            LanguageSection(
              language: 'العربية',
              text: phrase.arabic,
              pronunciation: phrase.arabicPronunciation,
              icon: Icons.translate,
              isArabic: true,
              onPlayAudio: () => _playAudio(context, phrase.arabic, 'ar'),
            ),
          ],
        ),
      ),
    );
  }
}
