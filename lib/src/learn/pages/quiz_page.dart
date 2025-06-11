import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    int currentQuestionIndex = 0;
    int score = 0;
    bool showResult = false;

    final List<Map<String, dynamic>> quizQuestions = [
      {
        'question': 'ماء',
        'pronunciation': '/maa\'/',
        'options': ['Son', 'Blue', 'Water', 'White'],
        'correct': 2,
      },
      {
        'question': 'أسد',
        'pronunciation': '/asad/',
        'options': ['Cat', 'Lion', 'Dog', 'Bird'],
        'correct': 1,
      },
      {
        'question': 'أحمر',
        'pronunciation': '/ahmar/',
        'options': ['Blue', 'Green', 'Red', 'Yellow'],
        'correct': 2,
      },
    ];
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (showResult) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.celebration,
                size: 80,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Quiz Complete!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your Score: $score/${quizQuestions.length}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                    showResult = false;
                  });
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    final question = quizQuestions[currentQuestionIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Test Your Knowledge',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Challenge yourself with these questions',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${currentQuestionIndex + 1}',
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      'Score: $score',
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'What does this mean in English?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  question['question'],
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  question['pronunciation'],
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
                ...List.generate(
                  question['options'].length,
                  (index) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: OutlinedButton(
                      onPressed: () {
                        if (index == question['correct']) {
                          setState(() {
                            score++;
                          });
                        }

                        Future.delayed(const Duration(milliseconds: 500), () {
                          setState(() {
                            if (currentQuestionIndex < quizQuestions.length - 1) {
                              currentQuestionIndex++;
                            } else {
                              showResult = true;
                            }
                          });
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: colorScheme.outline),
                      ),
                      child: Text(
                        question['options'][index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
