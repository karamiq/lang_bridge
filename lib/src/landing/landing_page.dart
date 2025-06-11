// main_landing_page.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/landing/pages/onboarding.dart';

// language_selection_wrapper.dart
class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  createState() => _LanguageSelectionWrapperState();
}

class _LanguageSelectionWrapperState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const OnboardingPages();
  }
}

class BackToLanguageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackToLanguageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.language,
        color: Colors.black54,
        size: 28,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 2,
      ),
    );
  }
}
