// lib/models/word_error.dart
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

class AccuracyResult {
  final int accuracy;
  final List<WordError> wordErrors;

  AccuracyResult({required this.accuracy, required this.wordErrors});
}
