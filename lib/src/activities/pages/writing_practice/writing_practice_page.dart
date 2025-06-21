import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lang_bridge/src/activities/pages/writing_practice/components/accuracy_calculator.dart';

// Main Writing Practice Page
class WritingPracticePage extends StatefulWidget {
  const WritingPracticePage({super.key});

  @override
  State<WritingPracticePage> createState() => _WritingPracticePageState();
}

class _WritingPracticePageState extends State<WritingPracticePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold();
  }
}
