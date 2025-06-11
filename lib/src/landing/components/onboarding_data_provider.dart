import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class OnboardingDataProvider {
  static List<LandingPageData> getPages(BuildContext context) {
    return [
      LandingPageData(
        title: context.l10n.learnEnglishAndArabic,
        subtitle: context.l10n.together,
        description:
            "${context.l10n.wordBankDescription} ${context.l10n.miniGamesDescription} ${context.l10n.audioPracticeDescription}",
        buttonText: context.l10n.startLearning,
        backgroundColor: context.colorScheme.background,
        titleGradient: const [
          AppColors.primary,
          AppColors.secondary,
          AppColors.accent,
          // Color(0xFF7B68EE),
          // Color(0xFF52C41A),
        ],
      ),
      LandingPageData(
        title: context.l10n.wordBank,
        subtitle: "",
        description: context.l10n.wordBankDescription,
        buttonText: context.l10n.exploreWords,
        backgroundColor: context.colorScheme.background,
        titleGradient: const [
          AppColors.primary,
          AppColors.secondary,
          AppColors.accent,
        ],
        icon: Icons.book,
        iconColor: const Color(0xFF4285F4),
      ),
      LandingPageData(
        title: context.l10n.miniGames,
        subtitle: "",
        description: context.l10n.miniGamesDescription,
        buttonText: context.l10n.playGames,
        backgroundColor: context.colorScheme.background,
        titleGradient: const [
          Color(0xFF52C41A),
          Color.fromARGB(255, 195, 255, 0),
        ],
        icon: Icons.games,
        iconColor: const Color(0xFF52C41A),
      ),
      LandingPageData(
        title: context.l10n.audioPractice,
        subtitle: "",
        description: context.l10n.audioPracticeDescription,
        buttonText: context.l10n.startPractice,
        backgroundColor: context.colorScheme.background,
        titleGradient: const [
          Color(0xFF7B68EE),
          Color(0xFF7B68EE),
        ],
        icon: Icons.mic,
        iconColor: const Color(0xFF7B68EE),
      ),
      LandingPageData(
        title: context.l10n.dailyChallenges,
        subtitle: "",
        description: context.l10n.dailyChallengesDescription,
        buttonText: context.l10n.takeChallenge,
        backgroundColor: context.colorScheme.background,
        titleGradient: const [
          Color(0xFFFF8C00),
          Color(0xFFFF8C00),
        ],
        icon: Icons.play_arrow,
        iconColor: const Color(0xFFFF8C00),
      ),
    ];
  }
}

// landing_page_data.dart
class LandingPageData {
  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final Color backgroundColor;
  final List<Color> titleGradient;
  final IconData? icon;
  final Color? iconColor;
  final bool isCtaPage;

  LandingPageData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.buttonText,
    required this.backgroundColor,
    required this.titleGradient,
    this.icon,
    this.iconColor,
    this.isCtaPage = false,
  });
}
