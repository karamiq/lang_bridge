// lib/widgets/sentence_display_card.dart
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/activities/pages/writing_practice/components/model.dart';

class SentenceDisplayCard extends StatelessWidget {
  final WritingSentenceModel sentence;
  final bool isArabic;

  const SentenceDisplayCard({
    super.key,
    required this.sentence,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.translate,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                isArabic ? 'Write in Arabic:' : 'Write in English:',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  isArabic ? sentence.english : sentence.arabic,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                    height: 1.5,
                  ),
                  textAlign: isArabic ? TextAlign.left : TextAlign.right,
                  textDirection: isArabic ? TextDirection.ltr : TextDirection.rtl,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
