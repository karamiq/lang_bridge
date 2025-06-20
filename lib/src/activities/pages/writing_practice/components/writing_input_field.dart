// lib/widgets/writing_input_field.dart
import 'package:flutter/material.dart';

class WritingInputField extends StatelessWidget {
  final bool isArabic;
  final String userInput;
  final ValueChanged<String> onChanged;
  final bool hasSubmitted;

  const WritingInputField({
    super.key,
    required this.isArabic,
    required this.userInput,
    required this.onChanged,
    required this.hasSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasSubmitted ? Colors.grey.withOpacity(0.3) : colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit,
                color: hasSubmitted ? Colors.grey : colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Your Answer:',
                style: TextStyle(
                  color: hasSubmitted ? Colors.grey : colorScheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              enabled: !hasSubmitted,
              maxLines: null,
              expands: true,
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: hasSubmitted ? colorScheme.onSurface.withOpacity(0.6) : colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hasSubmitted
                    ? 'Writing submitted'
                    : (isArabic ? 'اكتب الجملة باللغة العربية...' : 'Write the sentence in English...'),
                hintStyle: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
