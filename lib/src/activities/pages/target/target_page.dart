import 'package:flutter/material.dart';

// Data Models
class WordPair {
  final String english;
  final String arabic;
  final String pronunciation;
  final String category;

  WordPair({
    required this.english,
    required this.arabic,
    required this.pronunciation,
    required this.category,
  });
}

class GameState {
  final List<WordPair> currentWords;
  final WordPair targetWord;
  final int score;
  final int level;
  final bool isGameOver;
  final String gameMode; // 'english_to_arabic' or 'arabic_to_english'

  GameState({
    required this.currentWords,
    required this.targetWord,
    this.score = 0,
    this.level = 1,
    this.isGameOver = false,
    this.gameMode = 'english_to_arabic',
  });

  GameState copyWith({
    List<WordPair>? currentWords,
    WordPair? targetWord,
    int? score,
    int? level,
    bool? isGameOver,
    String? gameMode,
  }) {
    return GameState(
      currentWords: currentWords ?? this.currentWords,
      targetWord: targetWord ?? this.targetWord,
      score: score ?? this.score,
      level: level ?? this.level,
      isGameOver: isGameOver ?? this.isGameOver,
      gameMode: gameMode ?? this.gameMode,
    );
  }
}

// Sample Data
class GameData {
  static final List<WordPair> sampleWords = [
    WordPair(english: 'Apple', arabic: 'تفاح', pronunciation: 'tuffah', category: 'Food'),
    WordPair(english: 'Cat', arabic: 'قط', pronunciation: 'qitt', category: 'Animals'),
    WordPair(english: 'Red', arabic: 'أحمر', pronunciation: 'ahmar', category: 'Colors'),
    WordPair(english: 'One', arabic: 'واحد', pronunciation: 'wahid', category: 'Numbers'),
    WordPair(english: 'Mother', arabic: 'أم', pronunciation: 'umm', category: 'Family'),
    WordPair(english: 'Book', arabic: 'كتاب', pronunciation: 'kitab', category: 'School'),
    WordPair(english: 'Blue', arabic: 'أزرق', pronunciation: 'azraq', category: 'Colors'),
    WordPair(english: 'Dog', arabic: 'كلب', pronunciation: 'kalb', category: 'Animals'),
    WordPair(english: 'Two', arabic: 'اثنان', pronunciation: 'ithnan', category: 'Numbers'),
    WordPair(english: 'Water', arabic: 'ماء', pronunciation: 'maa', category: 'Food'),
  ];
}

// Game Logic Controller
class GameController extends ChangeNotifier {
  GameState _gameState = GameState(
    currentWords: [],
    targetWord: GameData.sampleWords.first,
  );

  GameState get gameState => _gameState;

  void startNewGame() {
    final shuffledWords = List<WordPair>.from(GameData.sampleWords)..shuffle();
    _gameState = GameState(
      currentWords: shuffledWords.take(4).toList(),
      targetWord: shuffledWords.first,
      score: 0,
      level: 1,
      isGameOver: false,
    );
    notifyListeners();
  }

  void selectWord(WordPair selectedWord) {
    if (_gameState.isGameOver) return;

    bool isCorrect = selectedWord == _gameState.targetWord;

    if (isCorrect) {
      _gameState = _gameState.copyWith(
        score: _gameState.score + 10,
      );
      _nextRound();
    } else {
      // Wrong answer - could implement lives system here
      _showFeedback(false);
    }

    notifyListeners();
  }

  void _nextRound() {
    final shuffledWords = List<WordPair>.from(GameData.sampleWords)..shuffle();
    _gameState = _gameState.copyWith(
      currentWords: shuffledWords.take(4).toList(),
      targetWord: shuffledWords.first,
      level: _gameState.level + 1,
    );
  }

  void _showFeedback(bool isCorrect) {
    // Implementation for showing feedback
  }

  void toggleGameMode() {
    String newMode = _gameState.gameMode == 'english_to_arabic' ? 'arabic_to_english' : 'english_to_arabic';

    _gameState = _gameState.copyWith(gameMode: newMode);
    notifyListeners();
  }

  void resetGame() {
    startNewGame();
  }
}

// Custom Widgets

// Game Header Widget
class GameHeader extends StatelessWidget {
  final int score;
  final int level;
  final String gameMode;
  final VoidCallback onModeToggle;

  const GameHeader({
    super.key,
    required this.score,
    required this.level,
    required this.gameMode,
    required this.onModeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Score: $score',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Level: $level',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onModeToggle,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              gameMode == 'english_to_arabic' ? 'EN → AR' : 'AR → EN',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// Target Word Display Widget
class TargetWordDisplay extends StatelessWidget {
  final WordPair targetWord;
  final String gameMode;

  const TargetWordDisplay({
    super.key,
    required this.targetWord,
    required this.gameMode,
  });

  @override
  Widget build(BuildContext context) {
    bool showEnglish = gameMode == 'english_to_arabic';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        border: Border.all(color: Colors.amber.shade300, width: 2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.shade100,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Find the translation for:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            showEnglish ? targetWord.english : targetWord.arabic,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.amber.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          if (!showEnglish) ...[
            const SizedBox(height: 8),
            Text(
              '(${targetWord.pronunciation})',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Word Option Card Widget
class WordOptionCard extends StatelessWidget {
  final WordPair word;
  final String gameMode;
  final VoidCallback onTap;

  const WordOptionCard({
    super.key,
    required this.word,
    required this.gameMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool showArabic = gameMode == 'english_to_arabic';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              showArabic ? word.arabic : word.english,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (showArabic) ...[
              const SizedBox(height: 4),
              Text(
                '(${word.pronunciation})',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                word.category,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Game Options Grid Widget
class GameOptionsGrid extends StatelessWidget {
  final List<WordPair> options;
  final String gameMode;
  final Function(WordPair) onWordSelected;

  const GameOptionsGrid({
    super.key,
    required this.options,
    required this.gameMode,
    required this.onWordSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map((word) => WordOptionCard(
                word: word,
                gameMode: gameMode,
                onTap: () => onWordSelected(word),
              ))
          .toList(),
    );
  }
}

// Game Controls Widget
class GameControls extends StatelessWidget {
  final VoidCallback onRestart;
  final VoidCallback onPause;

  const GameControls({
    super.key,
    required this.onRestart,
    required this.onPause,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: onRestart,
          icon: const Icon(Icons.refresh),
          label: const Text('Restart'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: onPause,
          icon: const Icon(Icons.pause),
          label: const Text('Pause'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}

// Feedback Widget
class GameFeedback extends StatelessWidget {
  final bool isCorrect;
  final String message;
  final VoidCallback onContinue;

  const GameFeedback({
    super.key,
    required this.isCorrect,
    required this.message,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.red,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            color: isCorrect ? Colors.green : Colors.red,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: isCorrect ? Colors.green : Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

// Main Target Game Page
class TargetPage extends StatefulWidget {
  const TargetPage({super.key});

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  late GameController _gameController;

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
    _gameController.startNewGame();
  }

  @override
  void dispose() {
    _gameController.dispose();
    super.dispose();
  }

  void _handleWordSelection(WordPair selectedWord) {
    _gameController.selectWord(selectedWord);

    // Show feedback
    bool isCorrect = selectedWord == _gameController.gameState.targetWord;
    _showFeedbackDialog(isCorrect, selectedWord);
  }

  void _showFeedbackDialog(bool isCorrect, WordPair selectedWord) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: GameFeedback(
          isCorrect: isCorrect,
          message: isCorrect
              ? 'Excellent! 🎉'
              : 'Try again! The correct answer is ${_gameController.gameState.gameMode == 'english_to_arabic' ? _gameController.gameState.targetWord.arabic : _gameController.gameState.targetWord.english}',
          onContinue: () {
            Navigator.of(context).pop();
            if (isCorrect) {
              // Auto-advance to next round after a short delay
              Future.delayed(const Duration(milliseconds: 500), () {
                if (mounted) {
                  setState(() {
                    // The game controller already advanced to next round
                  });
                }
              });
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Target Game',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: _gameController,
        builder: (context, child) {
          final gameState = _gameController.gameState;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Game Header
                  GameHeader(
                    score: gameState.score,
                    level: gameState.level,
                    gameMode: gameState.gameMode,
                    onModeToggle: () => _gameController.toggleGameMode(),
                  ),

                  const SizedBox(height: 16),

                  // Target Word Display
                  TargetWordDisplay(
                    targetWord: gameState.targetWord,
                    gameMode: gameState.gameMode,
                  ),

                  const SizedBox(height: 16),

                  // Game Options
                  Expanded(
                    child: SingleChildScrollView(
                      child: GameOptionsGrid(
                        options: gameState.currentWords,
                        gameMode: gameState.gameMode,
                        onWordSelected: _handleWordSelection,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Game Controls
                  GameControls(
                    onRestart: () => _gameController.resetGame(),
                    onPause: () {
                      // Implement pause functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Game Paused')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
