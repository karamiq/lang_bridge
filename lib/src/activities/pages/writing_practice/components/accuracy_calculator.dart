// lib/utils/accuracy_calculator.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/activities/pages/writing_practice/components/word_error.dart';

class AccuracyCalculator {
  static AccuracyResult calculateAccuracy(String userInput, String correctText) {
    if (userInput.isEmpty) {
      return AccuracyResult(
        accuracy: 0,
        highlightedText: [
          TextSpan(
            text: correctText,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    final userWords = userInput.trim().split(RegExp(r'\s+'));
    final correctWords = correctText.trim().split(RegExp(r'\s+'));

    int correctCount = 0;
    List<TextSpan> wordErrors = [];

    // Calculate word-by-word accuracy
    for (int i = 0; i < max(userWords.length, correctWords.length); i++) {
      if (i < userWords.length && i < correctWords.length) {
        if (userWords[i].toLowerCase() == correctWords[i].toLowerCase()) {
          correctCount++;
        } else {
          wordErrors.add(TextSpan(
            text: correctWords[i],
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ));
        }
      } else if (i >= userWords.length) {
        wordErrors.add(
          TextSpan(
            text: correctWords[i],
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      } else {
        wordErrors.add(
          TextSpan(
            text: userWords[i],
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      }
    }

    // Character-level similarity for partial credit
    final similarity = _calculateStringSimilarity(userInput.toLowerCase(), correctText.toLowerCase());
    final baseAccuracy = correctWords.isEmpty ? 0 : (correctCount / correctWords.length * 100).round();
    final finalAccuracy = max(baseAccuracy, (similarity * 100).round());

    return AccuracyResult(accuracy: finalAccuracy, highlightedText: wordErrors);
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
