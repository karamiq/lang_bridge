import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/landing/components/onboarding_data_provider.dart';
import 'package:lang_bridge/src/landing/components/page_indicator.dart';
import 'package:lang_bridge/src/landing/landing_page.dart';
import 'package:lang_bridge/src/landing/pages/last_page.dart';

class OnboardingPages extends ConsumerStatefulWidget {
  const OnboardingPages({super.key});

  @override
  createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends ConsumerState<OnboardingPages> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _indicatorController;
  late Animation<double> _indicatorAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _indicatorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _indicatorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _indicatorController,
      curve: Curves.easeInOut,
    ));

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _indicatorController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _indicatorController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
    _indicatorController.reset();
    _indicatorController.forward();
  }

  void _handleBackToLanguageSelection() {
    context.pop();
  }

  void _handleNextPage() {
    if (_currentPage < OnboardingDataProvider.getPages(context).length) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(RoutesDocument.learnWords);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = OnboardingDataProvider.getPages(context);

    return Scaffold(
      body: Stack(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: pages.length + 1,
              itemBuilder: (context, index) {
                if (index >= pages.length) {
                  return LastPage(
                    lastPagePressed: _handleNextPage,
                  );
                }
                return OnboardingPageWidget(
                  data: pages[index],
                  onButtonPressed: _handleNextPage,
                );
              },
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: SafeArea(
              child: BackToLanguageButton(
                onPressed: _handleBackToLanguageSelection,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: PageIndicator(
              currentPage: _currentPage,
              pageCount: pages.length + 1,
              animation: _indicatorAnimation,
            ),
          ),
        ],
      ),
    );
  }
}
