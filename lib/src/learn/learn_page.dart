import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
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
        RoutesDocument.learnQuiz,
        RoutesDocument.learnPhrases,
      ];

  /// Determines the currently selected navigation index
  int _getCurrentNavigationIndex() {
    final currentPath = GoRouterState.of(context).fullPath;
    if (currentPath == null) return 0;

    final index = _navigationPages.indexOf(currentPath);
    return index != -1 ? index : 0;
  }

  /// Handles elegant navigation between sections
  void _navigateToSection(int index) {
    if (index >= 0 && index < _navigationPages.length) {
      // Add a subtle haptic feedback for delightful interaction
      HapticFeedback.lightImpact();

      GoRouter.of(context).go(_navigationPages[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      // appBar: AppBar(
      //   //   title: const Text('Learn'),
      //   //   centerTitle: true,
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   actions: [
      //     IconButton(
      //       icon: settings.themeMode.isDark
      //           ? Icon(Icons.dark_mode, color: context.colorScheme.onPrimary)
      //           : Icon(Icons.light_mode, color: context.colorScheme.onPrimary),
      //       onPressed: () async {
      //         ref.read(settingsProvider.notifier).toggleThemeMode(context);
      //         print('Updating categories...');
      //         // for (var category in wordBank) {
      //         //   try {
      //         //     await FirebaseFirestore.instance
      //         //         .collection('categories')
      //         //         .doc(category.id)
      //         //         .set(category.toJson(), SetOptions(merge: true));
      //         //   } on PlatformException catch (e) {
      //         //     throw Exception('Error updating category ${category.category}: $e');
      //         //   }
      //         // }
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.language, color: context.colorScheme.onPrimary),
      //       onPressed: () {
      //         ref.read(settingsProvider.notifier).toggleLocale();
      //       },
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          UpperNavigationBar(
            selectedIndex: _getCurrentNavigationIndex(),
            onTabChanged: _navigateToSection,
            tabs: [
              UpperNavigationBarButton(
                label: 'Words',
                icon: Icons.book_rounded,
              ),
              UpperNavigationBarButton(
                label: 'Quiz',
                icon: Icons.quiz_rounded,
              ),
              UpperNavigationBarButton(
                label: 'Phrases',
                icon: Icons.chat_bubble_rounded,
              ),
            ],
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
