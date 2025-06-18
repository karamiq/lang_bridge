import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/category_model.dart';

class FilterBottomSheet extends StatelessWidget {
  final List<PhraseEnum> categories;
  final PhraseEnum? selectedCategory;
  final Function(PhraseEnum?) onCategorySelected;

  const FilterBottomSheet({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Map<String, IconData> categoryIcons = {
      context.l10n.all: Icons.all_inclusive,
      context.l10n.introduction: Icons.person,
      context.l10n.greetings: Icons.waving_hand,
      context.l10n.common_phrases: Icons.forum,
      context.l10n.questions: Icons.help_outline,
      context.l10n.directions: Icons.navigation,
      context.l10n.shopping: Icons.shopping_bag,
      context.l10n.food_and_drink: Icons.restaurant,
      context.l10n.travel: Icons.flight_takeoff,
      context.l10n.emergencies: Icons.emergency,
    };

    final allCategories = [null, ...categories];

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.filterByCategory,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: allCategories.length,
                        itemBuilder: (context, index) {
                          final category = allCategories[index];
                          final isSelected = selectedCategory == category;

                          final String title = category?.name(context) ?? context.l10n.all;
                          final IconData icon = categoryIcons[title] ?? Icons.category;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? colorScheme.primary.withOpacity(0.2)
                                      : colorScheme.surfaceContainerHighest.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  icon,
                                  color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                              ),
                              title: Text(
                                title,
                                style: TextStyle(
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                  color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                                ),
                              ),
                              trailing:
                                  isSelected ? Icon(Icons.check_circle, color: colorScheme.primary) : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onTap: () {
                                onCategorySelected(category);
                                context.pop();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
