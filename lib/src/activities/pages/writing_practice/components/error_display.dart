// lib/widgets/error_display_widget.dart
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/activities/pages/writing_practice/components/word_error.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String userInput;
  final List<WordError> wordErrors;
  final String correctText;
  final bool isArabic;

  const ErrorDisplayWidget({
    super.key,
    required this.userInput,
    required this.wordErrors,
    required this.correctText,
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
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Corrections Needed',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserInputSection(colorScheme),
                  const SizedBox(height: 16),
                  _buildCorrectTextSection(colorScheme),
                  const SizedBox(height: 16),
                  _buildErrorSummary(colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInputSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Answer:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.withOpacity(0.3)),
          ),
          child: _buildHighlightedUserText(),
        ),
      ],
    );
  }

  Widget _buildCorrectTextSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Correct Answer:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.withOpacity(0.3)),
          ),
          child: Text(
            correctText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.green[800],
              height: 1.4,
            ),
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorSummary(ColorScheme colorScheme) {
    final incorrectCount = wordErrors.where((e) => e.type == WordErrorType.incorrect).length;
    final missingCount = wordErrors.where((e) => e.type == WordErrorType.missing).length;
    final extraCount = wordErrors.where((e) => e.type == WordErrorType.extra).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Error Summary:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        if (incorrectCount > 0)
          _buildErrorSummaryItem(
            icon: Icons.edit,
            color: Colors.red,
            text: '$incorrectCount incorrect word${incorrectCount > 1 ? 's' : ''}',
          ),
        if (missingCount > 0)
          _buildErrorSummaryItem(
            icon: Icons.add,
            color: Colors.orange,
            text: '$missingCount missing word${missingCount > 1 ? 's' : ''}',
          ),
        if (extraCount > 0)
          _buildErrorSummaryItem(
            icon: Icons.remove,
            color: Colors.purple,
            text: '$extraCount extra word${extraCount > 1 ? 's' : ''}',
          ),
      ],
    );
  }

  Widget _buildErrorSummaryItem({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightedUserText() {
    if (userInput.isEmpty) {
      return Text(
        'No input provided',
        style: TextStyle(
          fontSize: 14,
          color: Colors.red.withOpacity(0.7),
          fontStyle: FontStyle.italic,
        ),
      );
    }

    final userWords = userInput.trim().split(RegExp(r'\s+'));
    final correctWords = correctText.trim().split(RegExp(r'\s+'));

    return Wrap(
      children: userWords.asMap().entries.map((entry) {
        final index = entry.key;
        final word = entry.value;

        final error = wordErrors.firstWhere(
          (e) => e.position == index && e.type != WordErrorType.missing,
          orElse: () => WordError(
            position: -1,
            userWord: '',
            correctWord: '',
            type: WordErrorType.incorrect,
          ),
        );

        final hasError = error.position == index;
        final isCorrect =
            index < correctWords.length && word.toLowerCase() == correctWords[index].toLowerCase();

        Color textColor;
        Color? backgroundColor;

        if (isCorrect) {
          textColor = Colors.green[800]!;
          backgroundColor = Colors.green.withOpacity(0.2);
        } else if (error.type == WordErrorType.extra) {
          textColor = Colors.purple[800]!;
          backgroundColor = Colors.purple.withOpacity(0.2);
        } else {
          textColor = Colors.red[800]!;
          backgroundColor = Colors.red.withOpacity(0.2);
        }

        return Container(
          margin: const EdgeInsets.only(right: 4, bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            word,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
