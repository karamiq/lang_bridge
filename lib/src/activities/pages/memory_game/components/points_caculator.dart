class PointsCalculator {
  static const int maxScore = 300;
  static const int minScore = 20;
  static const int totalPairs = 8; // For a 16-card game
  static const int optimalMoves = totalPairs; // One move per pair
  static const int maxTimeBonusSeconds = 60;

  static int calculatePoints({
    required int moves,
    required Duration gameTime,
  }) {
    // Efficiency score: full points if optimal, less if extra moves
    double moveEfficiency = optimalMoves / moves;
    moveEfficiency = moveEfficiency.clamp(0.3, 1.0); // Prevents too harsh penalty

    // Time score: bonus if finished under 60s
    int gameSeconds = gameTime.inSeconds;
    double timeFactor = ((maxTimeBonusSeconds - gameSeconds) / maxTimeBonusSeconds).clamp(0, 1);

    // Combine the two into a weighted formula
    double weightedScore = (0.7 * moveEfficiency + 0.3 * timeFactor);

    int finalPoints = (minScore + (maxScore - minScore) * weightedScore).round();

    return finalPoints.clamp(minScore, maxScore);
  }
}
