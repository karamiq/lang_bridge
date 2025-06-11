import 'package:flutter/material.dart';
import 'dart:math' as math;

class PhrasesPage extends StatefulWidget {
  const PhrasesPage({super.key});

  @override
  createState() => _PhrasesPageState();
}

class _PhrasesPageState extends State<PhrasesPage> with TickerProviderStateMixin {
  late AnimationController _staggerController;
  final List<Map<String, String>> phrases = [
    {
      'english': 'My name is...',
      'arabic': 'اسمي...',
      'phonetic': '/ismi.../',
    },
    {
      'english': 'I am a student',
      'arabic': 'أنا طالب',
      'phonetic': '/ana taalib/',
    },
    {
      'english': 'What is your name?',
      'arabic': 'ما اسمك؟',
      'phonetic': '/ma ismuk?/',
    },
  ];

  @override
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Animated Header Section
        AnimatedBuilder(
          animation: _staggerController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - _staggerController.value)),
              child: Opacity(
                opacity: _staggerController.value,
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primaryContainer,
                        colorScheme.secondaryContainer,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.chat_bubble_rounded,
                          color: colorScheme.onPrimary,
                          size: 32,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Essential Phrases',
                        style: TextStyle(
                          color: colorScheme.onPrimaryContainer,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Master everyday conversations',
                        style: TextStyle(
                          color: colorScheme.onPrimaryContainer.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),

        // Animated Phrases List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: phrases.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _staggerController,
                builder: (context, child) {
                  final delay = index * 0.2;
                  final animationValue = Curves.easeOutBack.transform(
                    math.max(0.0, (_staggerController.value - delay) / (1.0 - delay)),
                  );

                  return Transform.translate(
                    offset: Offset(0, 30 * (1 - animationValue)),
                    child: Opacity(
                      opacity: animationValue,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: colorScheme.outline.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.shadow.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          phrases[index]['english']!,
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          phrases[index]['arabic']!,
                                          style: TextStyle(
                                            color: colorScheme.secondary,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          phrases[index]['phonetic']!,
                                          style: TextStyle(
                                            color: colorScheme.onSurface.withOpacity(0.6),
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: colorScheme.primaryContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.volume_up_rounded,
                                      color: colorScheme.onPrimaryContainer,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
