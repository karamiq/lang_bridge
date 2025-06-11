import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lang_bridge/common_lib.dart';

class LanguageCard extends ConsumerWidget {
  final String language;
  final String flag;
  final String title;
  final String subtitle;
  final String? pressedLanguage;
  final String? selectedLanguage;
  final Function(String) onLanguagePressed;
  final VoidCallback onLanguageReleased;
  final Function(String) onLanguageSelected;

  const LanguageCard({
    super.key,
    required this.language,
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.pressedLanguage,
    required this.selectedLanguage,
    required this.onLanguagePressed,
    required this.onLanguageReleased,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = selectedLanguage == language;
    final isPressed = pressedLanguage == language;

    return GestureDetector(
      onTapDown: (_) {
        onLanguagePressed(language);
        HapticFeedback.lightImpact();
      },
      onTapUp: (_) {
        onLanguageReleased();
      },
      onTapCancel: () {
        onLanguageReleased();
      },
      onTap: () {
        onLanguageSelected(language);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        transform: Matrix4.identity()..scale(isPressed ? 0.9 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : (isPressed ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: isPressed || isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.identity()..scale(isPressed ? 1.1 : 1.0),
              child: Text(
                flag,
                style: const TextStyle(fontSize: 48),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? const Color(0xFF6366F1)
                    : (isPressed ? const Color(0xFF6366F1) : Colors.white),
              ),
              child: Text(
                title,
                textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 14,
                color: isSelected
                    ? const Color(0xFF6366F1).withOpacity(0.7)
                    : (isPressed ? const Color(0xFF6366F1).withOpacity(0.8) : Colors.white.withOpacity(0.8)),
              ),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              ),
            ),
            const SizedBox(height: 12),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF6366F1).withOpacity(0.1)
                    : (isPressed ? const Color(0xFF6366F1).withOpacity(0.2) : Colors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  isSelected ? '✓ Selected' : 'Tap to select',
                  key: ValueKey(isSelected ? 'selected' : 'tap'),
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? const Color(0xFF6366F1)
                        : (isPressed ? const Color(0xFF6366F1) : Colors.white.withOpacity(0.9)),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
