// lib/utils/accuracy_calculator.dart
import 'dart:math';
import 'package:lang_bridge/src/activities/pages/writing_practice/components/word_error.dart';

class AccuracyCalculator {
  static AccuracyResult calculateAccuracy(String userInput, String correctText) {
    if (userInput.isEmpty) {
      return AccuracyResult(
        accuracy: 0,
        wordErrors: [
          WordError(
            position: 0,
            userWord: '',
            correctWord: correctText,
            type: WordErrorType.missing,
          )
        ],
      );
    }

    final userWords = userInput.trim().split(RegExp(r'\s+'));
    final correctWords = correctText.trim().split(RegExp(r'\s+'));

    int correctCount = 0;
    List<WordError> wordErrors = [];

    // Calculate word-by-word accuracy
    for (int i = 0; i < max(userWords.length, correctWords.length); i++) {
      if (i < userWords.length && i < correctWords.length) {
        if (userWords[i].toLowerCase() == correctWords[i].toLowerCase()) {
          correctCount++;
        } else {
          wordErrors.add(WordError(
            position: i,
            userWord: userWords[i],
            correctWord: correctWords[i],
            type: WordErrorType.incorrect,
          ));
        }
      } else if (i >= userWords.length) {
        wordErrors.add(WordError(
          position: i,
          userWord: '',
          correctWord: correctWords[i],
          type: WordErrorType.missing,
        ));
      } else {
        wordErrors.add(WordError(
          position: i,
          userWord: userWords[i],
          correctWord: '',
          type: WordErrorType.extra,
        ));
      }
    }

    // Character-level similarity for partial credit
    final similarity = _calculateStringSimilarity(userInput.toLowerCase(), correctText.toLowerCase());
    final baseAccuracy = correctWords.isEmpty ? 0 : (correctCount / correctWords.length * 100).round();
    final finalAccuracy = max(baseAccuracy, (similarity * 100).round());

    return AccuracyResult(accuracy: finalAccuracy, wordErrors: wordErrors);
  }

  static double _calculateStringSimilarity(String a, String b) {
    if (a.isEmpty && b.isEmpty) return 1.0;
    if (a.isEmpty || b.isEmpty) return 0.0;

    final matrix = List.generate(a.length + 1, (i) => List.filled(b.length + 1, 0));

    for (int i = 0; i <= a.length; i++) {
      matrix[i][0] = i;
    }
    for (int j = 0; j <= b.length; j++) {
      matrix[0][j] = j;
    }

    for (int i = 1; i <= a.length; i++) {
      for (int j = 1; j <= b.length; j++) {
        final cost = a[i - 1] == b[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost,
        ].reduce(min);
      }
    }

    return 1.0 - (matrix[a.length][b.length] / max(a.length, b.length));
  }
}
