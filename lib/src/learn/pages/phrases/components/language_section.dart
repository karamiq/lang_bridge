import 'package:flutter/material.dart';
import 'package:lang_bridge/utils/extensions.dart';

class LanguageSection extends StatelessWidget {
  final String language;
  final String text;
  final String pronunciation;
  final IconData icon;
  final bool isArabic;
  final VoidCallback onPlayAudio;

  const LanguageSection({
    super.key,
    required this.language,
    required this.text,
    required this.pronunciation,
    required this.icon,
    required this.isArabic,
    required this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: colorScheme.primary, size: 16),
            ),
            const SizedBox(width: 12),
            Text(
              language,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Material(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: onPlayAudio,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.volume_up,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: isArabic ? 20 : 18,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
            fontFamily: isArabic ? 'thuluth' : null,
            height: 1.3,
          ),
          textAlign: isArabic ? TextAlign.right : TextAlign.left,
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: context.theme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.secondary.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.record_voice_over,
                color: colorScheme.secondary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  pronunciation,
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
