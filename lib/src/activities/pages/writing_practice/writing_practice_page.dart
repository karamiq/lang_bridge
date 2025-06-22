import 'package:flutter/material.dart';

// Main Writing Practice Page
class WritingPracticePage extends StatefulWidget {
  const WritingPracticePage({super.key});

  @override
  State<WritingPracticePage> createState() => _WritingPracticePageState();
}

class _WritingPracticePageState extends State<WritingPracticePage> {
  final PageController _pageController = PageController();
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold();
  }
}
