import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/daily_models.dart';

class DailyQuizCard extends StatefulWidget {
  final List<QuizQuestionModel> quizQuestions;
  final VoidCallback onComplete;

  const DailyQuizCard({
    super.key,
    required this.quizQuestions,
    required this.onComplete,
  });

  @override
  State<DailyQuizCard> createState() => _DailyQuizCardState();
}

class _DailyQuizCardState extends State<DailyQuizCard> {
  int currentQuizIndex = 0;
  int? selectedAnswer;
  bool showResult = false;

  void _onAnswerSelected(int index) {
    if (showResult) return;
    setState(() {
      selectedAnswer = index;
    });
  }

  void _onSubmitAnswer() {
    if (selectedAnswer == null) return;
    setState(() {
      showResult = true;
    });
  }

  void _nextQuestion() {
    if (currentQuizIndex < widget.quizQuestions.length - 1) {
      setState(() {
        currentQuizIndex++;
        selectedAnswer = null;
        showResult = false;
      });
    } else {
      widget.onComplete();
    }
  }

  Color _getOptionColor(BuildContext context, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final correctIndex = widget.quizQuestions[currentQuizIndex].correctIndex;

    if (!showResult) {
      return selectedAnswer == index ? colorScheme.primary.withOpacity(0.15) : colorScheme.surface;
    }

    if (index == correctIndex) {
      return Colors.green.withOpacity(0.15);
    }
    if (selectedAnswer == index && index != correctIndex) {
      return Colors.red.withOpacity(0.15);
    }
    return colorScheme.surface;
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quizQuestions[currentQuizIndex];
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.quiz, color: colorScheme.primary, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${context.l10n.quiz} ${context.l10n.daily}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                Text(
                  '${currentQuizIndex + 1}/${widget.quizQuestions.length}',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Question Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                question.question,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),

            // Options
            ...List.generate(
              question.options.length,
              (index) => Container(
                margin: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: showResult ? null : () => _onAnswerSelected(index),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _getOptionColor(context, index),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedAnswer == index
                            ? colorScheme.primary
                            : colorScheme.outline.withOpacity(0.3),
                        width: selectedAnswer == index ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question.options[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        if (showResult && index == question.correctIndex)
                          const Icon(Icons.check_circle, color: Colors.green, size: 16),
                        if (showResult && selectedAnswer == index && index != question.correctIndex)
                          const Icon(Icons.cancel, color: Colors.red, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Button
            Row(
              children: [
                ElevatedButton(
                  onPressed: showResult ? _nextQuestion : _onSubmitAnswer,
                  child: Text(
                    showResult
                        ? (currentQuizIndex < widget.quizQuestions.length - 1
                            ? context.l10n.next
                            : context.l10n.finish)
                        : context.l10n.submit,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
