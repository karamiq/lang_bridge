/// Service for tracking reading progress through story parts
class StoryProgressTracker {
  int _currentPartIndex = 0;
  late final int _totalParts;

  StoryProgressTracker(int totalParts) : _totalParts = totalParts;

  int get currentPartIndex => _currentPartIndex;
  int get totalParts => _totalParts;
  double get progress => _totalParts > 0 ? (_currentPartIndex + 1) / _totalParts : 0.0;
  int get progressPercentage => (progress * 100).round();
  bool get isFirstPart => _currentPartIndex == 0;
  bool get isLastPart => _currentPartIndex >= _totalParts - 1;

  void setCurrentPart(int index) {
    if (index >= 0 && index < _totalParts) {
      _currentPartIndex = index;
    }
  }

  bool canGoNext() => !isLastPart;
  bool canGoPrevious() => !isFirstPart;

  void goNext() {
    if (canGoNext()) {
      _currentPartIndex++;
    }
  }

  void goPrevious() {
    if (canGoPrevious()) {
      _currentPartIndex--;
    }
  }
}
