// last_page.dart - Updated version
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/landing/components/onboarding_data_provider.dart';
import 'package:lang_bridge/src/landing/components/page_indicator.dart';
import '../../../common_lib.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key, required this.lastPagePressed});

  final VoidCallback lastPagePressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(gradient: isDark ? null : AppColors.primaryGradient),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: -0.3,
            child: Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(isDark ? 0.3 : 0.5),
                    spreadRadius: 80,
                    blurRadius: 100,
                    offset: const Offset(0, 40),
                  ),
                ],
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(isDark ? 0.9 : 1.0),
                    Colors.white.withOpacity(isDark ? 0.6 : 0.29),
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(isDark ? 0.15 : 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(isDark ? 0.25 : 0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.translate,
                  size: 160,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          OnboardingPageWidget(
            data: LandingPageData(
              title: context.l10n.readyToBridgeLanguages,
              subtitle: "",
              description: context.l10n.readyToBridgeLanguagesDescription,
              buttonText: context.l10n.getStartedToday,
              backgroundColor: Colors.transparent,
              titleGradient: const [
                Color(0xFFF0F0F0),
                Color.fromARGB(255, 255, 255, 255),
              ],
              // isCtaPage: true, // Removed
            ),
            onButtonPressed: lastPagePressed,
          )
        ],
      ),
    );
  }
}
