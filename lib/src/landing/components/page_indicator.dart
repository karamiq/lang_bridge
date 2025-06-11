import 'package:flutter/material.dart';
import 'package:lang_bridge/src/landing/components/onboarding_data_provider.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final Animation<double> animation;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pageCount,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: currentPage == index ? 24 : 8,
              decoration: BoxDecoration(
                color:
                    currentPage == index ? const Color(0xFF6366F1) : const Color(0xFF6366F1).withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}

// onboarding_page_widget.dart
class OnboardingPageWidget extends StatelessWidget {
  final LandingPageData data;
  final VoidCallback onButtonPressed;

  const OnboardingPageWidget({
    super.key,
    required this.data,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: data.backgroundColor == Colors.transparent ? Colors.transparent : (data.backgroundColor),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.icon != null) ...[
                OnboardingIcon(
                  icon: data.icon!,
                  iconColor: data.iconColor ?? colorScheme.primary,
                ),
                const SizedBox(height: 40),
              ],
              OnboardingTitle(
                title: data.title,
                subtitle: data.subtitle,
                titleGradient: data.titleGradient,
              ),
              const SizedBox(height: 30),
              OnboardingDescription(
                description: data.description,
              ),
              const SizedBox(height: 50),
              OnboardingButton(
                buttonText: data.buttonText,
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// onboarding_icon.dart
class OnboardingIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const OnboardingIcon({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
        );
      },
    );
  }
}

// onboarding_title.dart
class OnboardingTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> titleGradient;

  const OnboardingTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.titleGradient,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: titleGradient.isNotEmpty && titleGradient.first != Colors.white
                ? titleGradient
                : [colorScheme.onSurface, colorScheme.primary],
          ).createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: Colors.white, // This will be masked by the shader
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

// onboarding_description.dart
class OnboardingDescription extends StatelessWidget {
  final String description;

  const OnboardingDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      description,
      style: TextStyle(
        fontSize: 18,
        color: colorScheme.onSurface.withOpacity(0.7),
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}

// onboarding_button.dart
class OnboardingButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const OnboardingButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 8,
          shadowColor: colorScheme.shadow.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
