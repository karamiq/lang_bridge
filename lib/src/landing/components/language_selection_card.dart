import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/landing/components/language_card.dart';

class LanguageSelectionCards extends ConsumerWidget {
  final String? pressedLanguage;
  final String? selectedLanguage;
  final Function(String) onLanguagePressed;
  final VoidCallback onLanguageReleased;
  final Function(String) onLanguageSelected;

  const LanguageSelectionCards({
    super.key,
    required this.pressedLanguage,
    required this.selectedLanguage,
    required this.onLanguagePressed,
    required this.onLanguageReleased,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Select Language / اختر اللغة',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 40),

        // Language options
        Row(
          children: [
            Expanded(
              child: LanguageCard(
                language: 'en',
                flag: '🇺🇸',
                title: 'English',
                subtitle: 'Continue in English',
                pressedLanguage: pressedLanguage,
                selectedLanguage: selectedLanguage,
                onLanguagePressed: onLanguagePressed,
                onLanguageReleased: onLanguageReleased,
                onLanguageSelected: onLanguageSelected,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LanguageCard(
                language: 'ar',
                flag: '🇸🇦',
                title: 'العربية',
                subtitle: 'متابعة بالعربية',
                pressedLanguage: pressedLanguage,
                selectedLanguage: selectedLanguage,
                onLanguagePressed: onLanguagePressed,
                onLanguageReleased: onLanguageReleased,
                onLanguageSelected: onLanguageSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
