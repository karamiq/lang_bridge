// lib/models/word_error.dart
import 'package:flutter/material.dart';

class WordError {
  final int position;
  final String userWord;
  final String correctWord;
  final WordErrorType type;

  WordError({
    required this.position,
    required this.userWord,
    required this.correctWord,
    required this.type,
  });
}

enum WordErrorType {
  incorrect,
  missing,
  extra,
}

// Accuracy Result Card Widget
class AccuracyResult {
  final int accuracy;
  final List<TextSpan> highlightedText;

  AccuracyResult({
    required this.accuracy,
    required this.highlightedText,
  });
}
