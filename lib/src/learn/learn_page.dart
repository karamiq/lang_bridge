import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/learn/components/upper_navigation_bar.dart';
import 'package:lang_bridge/src/learn/components/upper_navigation_button.dart';

import '../../common_lib.dart';

class LearnPage extends StatefulHookConsumerWidget {
  final Widget child; // Add this to support nested routing
  const LearnPage({super.key, required this.child});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LearnPage();
}

class _LearnPage extends ConsumerState<LearnPage> {
  List<String> get _navigationPages => [
        RoutesDocument.learnWords,
        RoutesDocument.learnStories,
        RoutesDocument.learnPhrases,
      ];

  int _getCurrentNavigationIndex() {
    final currentPath = GoRouterState.of(context).fullPath;
    if (currentPath == null) return 0;

    final index = _navigationPages.indexOf(currentPath);
    return index != -1 ? index : 0;
  }

  void _navigateToSection(int index) {
    if (index >= 0 && index < _navigationPages.length) {
      HapticFeedback.lightImpact();

      GoRouter.of(context).go(_navigationPages[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UpperNavigationBar(
            selectedIndex: _getCurrentNavigationIndex(),
            onTabChanged: _navigateToSection,
            tabs: [
              UpperNavigationBarButton(
                label: context.l10n.words,
                icon: Assets.assetsSvgBook,
              ),
              UpperNavigationBarButton(
                label: context.l10n.stories,
                icon: Assets.assetsSvgBookShelf,
              ),
              UpperNavigationBarButton(
                label: context.l10n.phrases,
                icon: Assets.assetsSvgClosedBook,
              ),
            ],
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
