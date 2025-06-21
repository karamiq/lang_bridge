import 'package:lang_bridge/data/models/listening_practice_models.dart';

class ListeningPracticeLogic {
  int calculateAccuracy(String targetText, String userText) {
    final targetWords = targetText.toLowerCase().split(' ');
    final userWords = userText.toLowerCase().split(' ');

    int correctWords = 0;
    int totalWords = targetWords.length;

    for (int i = 0; i < targetWords.length; i++) {
      if (i < userWords.length && targetWords[i] == userWords[i]) {
        correctWords++;
      }
    }

    return ((correctWords / totalWords) * 100).round();
  }

  int calculatePoints(int accuracy) {
    // Points calculation based on accuracy (20-250 range)
    // 0-20%: 20 points
    // 21-40%: 50 points
    // 41-60%: 80 points
    // 61-80%: 120 points
    // 81-90%: 180 points
    // 91-100%: 250 points

    if (accuracy <= 20) return 20;
    if (accuracy <= 40) return 50;
    if (accuracy <= 60) return 80;
    if (accuracy <= 80) return 120;
    if (accuracy <= 90) return 180;
    return 250;
  }

  List<WordComparisonModel> generateWordComparisons(String targetText, String userText) {
    final targetWords = targetText.split(' ');
    final userWords = userText.split(' ');
    final comparisons = <WordComparisonModel>[];

    for (int i = 0; i < targetWords.length; i++) {
      final targetWord = targetWords[i];
      final userWord = i < userWords.length ? userWords[i] : '';
      final isCorrect = targetWord.toLowerCase() == userWord.toLowerCase();

      comparisons.add(WordComparisonModel(
        targetWord: targetWord,
        userWord: userWord,
        isCorrect: isCorrect,
        position: i,
        type: isCorrect
            ? WordComparisonType.exact
            : (userWord.isEmpty
                ? WordComparisonType.missing
                : (targetWord.toLowerCase().contains(userWord.toLowerCase())
                    ? WordComparisonType.similar
                    : WordComparisonType.wrong)),
      ));
    }

    return comparisons;
  }
}
