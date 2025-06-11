import 'package:flutter/material.dart';

class LanguageSelectionHeader extends StatelessWidget {
  const LanguageSelectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // App logo or icon
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.translate,
            size: 60,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),

        // Welcome text
        Text(
          'Welcome to',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w300,
          ),
        ),
        Spacer(),
        const Text(
          'Language Bridge',
          style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        Spacer(),
        Text(
          'Choose your preferred language to begin',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class LanguageSelectionFooter extends StatelessWidget {
  const LanguageSelectionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'تعلم اللغتان معاً',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Text(
          'Learn Languages Together',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
