import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WritingPracticePage extends StatefulWidget {
  const WritingPracticePage({super.key});

  @override
  State<WritingPracticePage> createState() => _WritingPracticePageState();
}

class _WritingPracticePageState extends State<WritingPracticePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isListening = false;
  int _currentSentenceIndex = 0;
  String _userInput = '';
  int _accuracy = 0;
  bool _hasSubmitted = false;
  List<WordComparison> _wordComparisons = [];

  final List<PracticeSentence> _sentences = [
    PracticeSentence(
      english: "The beautiful sunrise painted the sky with golden colors this morning.",
      arabic: "رسمت الشروق الجميلة السماء بألوان ذهبية هذا الصباح.",
      audioPath: "audio/sentence_1.mp3",
    ),
    PracticeSentence(
      english: "My grandmother always tells wonderful stories about her childhood adventures.",
      arabic: "جدتي تحكي دائماً قصصاً رائعة عن مغامرات طفولتها.",
      audioPath: "audio/sentence_2.mp3",
    ),
    PracticeSentence(
      english: "Learning new languages opens doors to different cultures and perspectives.",
      arabic: "تعلم اللغات الجديدة يفتح أبواباً لثقافات ووجهات نظر مختلفة.",
      audioPath: "audio/sentence_3.mp3",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _playAudio() {
    setState(() {
      _isListening = true;
    });

    // Simulate audio playing
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isListening = false;
        });
      }
    });

    // Here you would implement actual audio playback
    // AudioPlayer().play(AssetSource(_sentences[_currentSentenceIndex].audioPath));
  }

  void _submitWriting() {
    if (_userInput.trim().isEmpty) return;

    final accuracy = _calculateAccuracy();
    final comparisons = _generateWordComparisons();

    setState(() {
      _accuracy = accuracy;
      _wordComparisons = comparisons;
      _hasSubmitted = true;
    });

    HapticFeedback.mediumImpact();
  }

  int _calculateAccuracy() {
    final currentSentence = _sentences[_currentSentenceIndex];
    final targetText = currentSentence.english.toLowerCase();
    final userText = _userInput.toLowerCase();

    // Simple accuracy calculation based on word matching
    final targetWords = targetText.split(' ');
    final userWords = userText.split(' ');

    int correctWords = 0;
    int totalWords = targetWords.length;

    for (int i = 0; i < targetWords.length; i++) {
      if (i < userWords.length && targetWords[i] == userWords[i]) {
        correctWords++;
      }
    }

    return ((correctWords / totalWords) * 100).round();
  }

  List<WordComparison> _generateWordComparisons() {
    final currentSentence = _sentences[_currentSentenceIndex];
    final targetWords = currentSentence.english.split(' ');
    final userWords = _userInput.split(' ');
    final comparisons = <WordComparison>[];

    for (int i = 0; i < targetWords.length; i++) {
      final targetWord = targetWords[i];
      final userWord = i < userWords.length ? userWords[i] : '';
      final isCorrect = targetWord.toLowerCase() == userWord.toLowerCase();

      comparisons.add(WordComparison(
        targetWord: targetWord,
        userWord: userWord,
        isCorrect: isCorrect,
        position: i,
      ));
    }

    return comparisons;
  }

  void _nextSentence() {
    if (_currentSentenceIndex < _sentences.length - 1) {
      setState(() {
        _currentSentenceIndex++;
        _userInput = '';
        _textController.clear();
        _hasSubmitted = false;
        _wordComparisons.clear();
        _accuracy = 0;
      });
    }
  }

  void _resetPractice() {
    setState(() {
      _currentSentenceIndex = 0;
      _userInput = '';
      _textController.clear();
      _hasSubmitted = false;
      _wordComparisons.clear();
      _accuracy = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing Practice'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProgressIndicator(
                currentIndex: _currentSentenceIndex,
                totalCount: _sentences.length,
              ),
              const SizedBox(height: 24),
              _AudioPlayerCard(
                sentence: _sentences[_currentSentenceIndex],
                isListening: _isListening,
                onPlayAudio: _playAudio,
              ),
              const SizedBox(height: 24),
              _WritingInputCard(
                controller: _textController,
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    _userInput = value;
                  });
                },
                hasSubmitted: _hasSubmitted,
              ),
              const SizedBox(height: 24),
              if (!_hasSubmitted)
                _SubmitButton(
                  onPressed: _userInput.trim().isNotEmpty ? _submitWriting : null,
                ),
              if (_hasSubmitted) ...[
                _AccuracyResultCard(
                  accuracy: _accuracy,
                  wordComparisons: _wordComparisons,
                ),
                const SizedBox(height: 16),
                _ActionButtonsRow(
                  onNext: _currentSentenceIndex < _sentences.length - 1 ? _nextSentence : null,
                  onReset: _resetPractice,
                ),
              ],
              const SizedBox(height: 24),
              _TranslationCard(
                sentence: _sentences[_currentSentenceIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;

  const _ProgressIndicator({
    required this.currentIndex,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Progress: ${currentIndex + 1} / $totalCount',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (currentIndex + 1) / totalCount,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AudioPlayerCard extends StatelessWidget {
  final PracticeSentence sentence;
  final bool isListening;
  final VoidCallback onPlayAudio;

  const _AudioPlayerCard({
    required this.sentence,
    required this.isListening,
    required this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              isListening ? Icons.volume_up : Icons.headphones,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Listen carefully and write what you hear',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onPlayAudio,
              icon: Icon(isListening ? Icons.stop : Icons.play_arrow),
              label: Text(isListening ? 'Playing...' : 'Play Audio'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
            if (isListening) ...[
              const SizedBox(height: 16),
              const LinearProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }
}

class _WritingInputCard extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool hasSubmitted;

  const _WritingInputCard({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.hasSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Write what you heard:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              enabled: !hasSubmitted,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Type your answer here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _SubmitButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Submit Answer',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}

class _AccuracyResultCard extends StatelessWidget {
  final int accuracy;
  final List<WordComparison> wordComparisons;

  const _AccuracyResultCard({
    required this.accuracy,
    required this.wordComparisons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: _getAccuracyColor(context, accuracy),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getAccuracyIcon(accuracy),
                  size: 32,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                Text(
                  'Accuracy: $accuracy%',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _getAccuracyMessage(accuracy),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _WordComparisonWidget(comparisons: wordComparisons),
          ],
        ),
      ),
    );
  }

  Color _getAccuracyColor(BuildContext context, int accuracy) {
    if (accuracy >= 90) return Colors.green;
    if (accuracy >= 70) return Colors.orange;
    return Colors.red;
  }

  IconData _getAccuracyIcon(int accuracy) {
    if (accuracy >= 90) return Icons.star;
    if (accuracy >= 70) return Icons.thumb_up;
    return Icons.refresh;
  }

  String _getAccuracyMessage(int accuracy) {
    if (accuracy >= 90) return 'Excellent work! You\'re doing great!';
    if (accuracy >= 70) return 'Good job! Keep practicing to improve.';
    return 'Don\'t worry, practice makes perfect!';
  }
}

class _WordComparisonWidget extends StatelessWidget {
  final List<WordComparison> comparisons;

  const _WordComparisonWidget({required this.comparisons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Word-by-word comparison:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: comparisons.map((comparison) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: comparison.isCorrect ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  comparison.userWord.isEmpty ? '(missing)' : comparison.userWord,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ActionButtonsRow extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback onReset;

  const _ActionButtonsRow({
    required this.onNext,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        if (onNext != null) ...[
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onNext,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _TranslationCard extends StatelessWidget {
  final PracticeSentence sentence;

  const _TranslationCard({required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Translation:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                sentence.arabic,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      height: 1.5,
                    ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PracticeSentence {
  final String english;
  final String arabic;
  final String audioPath;

  PracticeSentence({
    required this.english,
    required this.arabic,
    required this.audioPath,
  });
}

class WordComparison {
  final String targetWord;
  final String userWord;
  final bool isCorrect;
  final int position;

  WordComparison({
    required this.targetWord,
    required this.userWord,
    required this.isCorrect,
    required this.position,
  });
}
