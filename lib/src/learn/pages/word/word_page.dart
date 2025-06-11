import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/components/custom_animation_builder.dart';
import 'package:lang_bridge/src/learn/components/category_card.dart';

class WordsPage extends ConsumerStatefulWidget {
  const WordsPage({super.key});

  @override
  createState() => _WordsPageState();
}

class _WordsPageState extends ConsumerState<WordsPage> with TickerProviderStateMixin {
  final List<CategoryData> categories = [
    CategoryData(
      title: 'Numbers',
      arabic: 'الأرقام',
      gradientColors: [Colors.blue, Colors.lightBlue],
      icon: Icons.format_list_numbered_rounded,
    ),
    CategoryData(
      title: 'Family',
      arabic: 'العائلة',
      gradientColors: [Colors.green, Colors.lightGreen],
      icon: Icons.family_restroom_rounded,
    ),
    CategoryData(
      title: 'School',
      arabic: 'المدرسة',
      gradientColors: [Colors.indigo, Colors.purple],
      icon: Icons.school_rounded,
    ),
    CategoryData(
      title: 'Food',
      arabic: 'الطعام',
      gradientColors: [Colors.orange, Colors.amber],
      icon: Icons.restaurant_rounded,
    ),
    CategoryData(
      title: 'Animals',
      arabic: 'الحيوانات',
      gradientColors: [Colors.orange, Colors.deepOrange],
      icon: Icons.pets_rounded,
    ),
    CategoryData(
      title: 'Colors',
      arabic: 'الألوان',
      gradientColors: [Colors.purple, Colors.deepPurple],
      icon: Icons.palette_rounded,
    ),
  ];
  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CustomAnimationBuilder(
          builder: (controller) {
            double animationValue = controller.value;

            final category = categories[index];
            return Transform.translate(
              offset: Offset(0, 50 * (1 - animationValue)),
              child: Opacity(
                opacity: animationValue,
                child: CategoryCard(
                  title: category.title,
                  arabic: category.arabic,
                  gradientColors: category.gradientColors,
                  icon: category.icon,
                  onPressed: () {
                    context.push(RoutesDocument.learnWordsCategory(
                      category.title,
                    ));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CategoryData {
  final String title;
  final String arabic;
  final List<Color> gradientColors;
  final IconData icon;

  const CategoryData({
    required this.title,
    required this.arabic,
    required this.gradientColors,
    required this.icon,
  });
}
