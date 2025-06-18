import 'package:flutter/material.dart';
import 'dart:math';

class WritingPracticePage extends StatefulWidget {
  const WritingPracticePage({super.key});

  @override
  State<WritingPracticePage> createState() => _WritingPracticePageState();
}

class _WritingPracticePageState extends State<WritingPracticePage> {
  int currentScore = 0;
  int currentLevel = 1;
  String selectedCategory = 'Animals';
  int currentQuestionIndex = 0;
  bool showAnswer = false;
  bool isCorrect = false;

  // Word bank organized by categories
  final Map<String, List<WordPair>> wordBank = {
    'Animals': [
      WordPair('قط', 'Cat', 'qit'),
      WordPair('كلب', 'Dog', 'kalb'),
      WordPair('أسد', 'Lion', 'asad'),
      WordPair('فيل', 'Elephant', 'fil'),
      WordPair('طائر', 'Bird', 'ta\'ir'),
      WordPair('سمك', 'Fish', 'samak'),
    ],
    'Colors': [
      WordPair('أحمر', 'Red', 'ahmar'),
      WordPair('أزرق', 'Blue', 'azraq'),
      WordPair('أخضر', 'Green', 'akhdar'),
      WordPair('أصفر', 'Yellow', 'asfar'),
      WordPair('أسود', 'Black', 'aswad'),
      WordPair('أبيض', 'White', 'abyad'),
    ],
    'Numbers': [
      WordPair('واحد', 'One', 'wahid'),
      WordPair('اثنان', 'Two', 'ithnan'),
      WordPair('ثلاثة', 'Three', 'thalatha'),
      WordPair('أربعة', 'Four', 'arba\'a'),
      WordPair('خمسة', 'Five', 'khamsa'),
      WordPair('ستة', 'Six', 'sitta'),
    ],
    'Family': [
      WordPair('أب', 'Father', 'ab'),
      WordPair('أم', 'Mother', 'umm'),
      WordPair('أخ', 'Brother', 'akh'),
      WordPair('أخت', 'Sister', 'ukht'),
      WordPair('جد', 'Grandfather', 'jadd'),
      WordPair('جدة', 'Grandmother', 'jadda'),
    ],
    'Food': [
      WordPair('تفاح', 'Apple', 'tuffah'),
      WordPair('خبز', 'Bread', 'khubz'),
      WordPair('ماء', 'Water', 'ma\''),
      WordPair('لبن', 'Milk', 'laban'),
      WordPair('أرز', 'Rice', 'aruzz'),
      WordPair('لحم', 'Meat', 'lahm'),
    ],
  };

  // Basic phrases
  final List<PhrasePair> basicPhrases = [
    PhrasePair('اسمي...', 'My name is...', 'ismi...'),
    PhrasePair('أنا طالب', 'I am a student', 'ana talib'),
    PhrasePair('ما اسمك؟', 'What is your name?', 'ma ismak?'),
    PhrasePair('كيف حالك؟', 'How are you?', 'kayf halak?'),
    PhrasePair('شكراً', 'Thank you', 'shukran'),
    PhrasePair('مع السلامة', 'Goodbye', 'ma\'a as-salama'),
  ];

  List<String> getCurrentOptions() {
    final words = wordBank[selectedCategory]!;
    final correctWord = words[currentQuestionIndex];
    final options = <String>[correctWord.english];

    // Add 3 random wrong options
    final random = Random();
    final allWords = wordBank.values.expand((list) => list).toList();

    while (options.length < 4) {
      final randomWord = allWords[random.nextInt(allWords.length)].english;
      if (!options.contains(randomWord)) {
        options.add(randomWord);
      }
    }

    options.shuffle();
    return options;
  }

  void checkAnswer(String selectedAnswer) {
    final correctAnswer = wordBank[selectedCategory]![currentQuestionIndex].english;
    setState(() {
      isCorrect = selectedAnswer == correctAnswer;
      showAnswer = true;
      if (isCorrect) {
        currentScore += 10;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < wordBank[selectedCategory]!.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
        currentLevel++;
      }
      showAnswer = false;
      isCorrect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      appBar: AppBar(
        title: const Text('LangBridge - Learn Arabic & English'),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Score and Level Display
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 24),
                      Text('Score: $currentScore',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.trending_up, color: Colors.green, size: 24),
                      Text('Level: $currentLevel',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Category Selection
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Category:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: wordBank.keys.map((category) {
                      return ChoiceChip(
                        label: Text(category),
                        selected: selectedCategory == category,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              selectedCategory = category;
                              currentQuestionIndex = 0;
                              showAnswer = false;
                            });
                          }
                        },
                        selectedColor: const Color(0xFF4A90E2),
                        labelStyle: TextStyle(
                          color: selectedCategory == category ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quiz Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text('Quiz: $selectedCategory',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A90E2))),

                  const SizedBox(height: 20),

                  // Arabic Word Display
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          wordBank[selectedCategory]![currentQuestionIndex].arabic,
                          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '(${wordBank[selectedCategory]![currentQuestionIndex].pronunciation})',
                          style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Audio playback would be implemented here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('🔊 Playing Arabic pronunciation...')),
                            );
                          },
                          icon: const Icon(Icons.volume_up),
                          label: const Text('Play Audio'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A90E2),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text('What does this word mean in English?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),

                  const SizedBox(height: 16),

                  // Answer Options
                  if (!showAnswer) ...[
                    ...getCurrentOptions().map((option) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ElevatedButton(
                          onPressed: () => checkAnswer(option),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: const BorderSide(color: Color(0xFF4A90E2)),
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(option, style: const TextStyle(fontSize: 16)),
                        ),
                      );
                    }),
                  ],

                  // Answer Result
                  if (showAnswer) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isCorrect ? Colors.green : Colors.red,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            isCorrect ? Icons.check_circle : Icons.cancel,
                            color: isCorrect ? Colors.green : Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isCorrect ? 'Correct! Well done!' : 'Incorrect. Try again!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Correct answer: ${wordBank[selectedCategory]![currentQuestionIndex].english}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A90E2),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Next Question'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Daily Phrases Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.chat_bubble, color: Color(0xFF4A90E2)),
                      SizedBox(width: 8),
                      Text('Daily Phrases', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...basicPhrases.take(3).map((phrase) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(phrase.arabic,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(phrase.english,
                                    style: const TextStyle(fontSize: 14, color: Color(0xFF666666))),
                                Text('(${phrase.pronunciation})',
                                    style: const TextStyle(fontSize: 12, color: Color(0xFF999999))),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('🔊 Playing: ${phrase.english}')),
                              );
                            },
                            icon: const Icon(Icons.play_circle_filled, color: Color(0xFF4A90E2)),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Daily Challenge
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B6B), Color(0xFFEE5A52)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.white),
                      SizedBox(width: 8),
                      Text('Daily Challenge',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Learn these words today:', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('قلم',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                            Text('Pen', style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('كتاب',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                            Text('Book', style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WordPair {
  final String arabic;
  final String english;
  final String pronunciation;

  WordPair(this.arabic, this.english, this.pronunciation);
}

class PhrasePair {
  final String arabic;
  final String english;
  final String pronunciation;

  PhrasePair(this.arabic, this.english, this.pronunciation);
}
