import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/models.dart';

class BilingualStoryContent extends ConsumerWidget {
  final StoryPart storyPart;
  final bool isFirstPart;

  const BilingualStoryContent({
    super.key,
    required this.storyPart,
    required this.isFirstPart,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isArabic = ref.watch(settingsProvider).locale.languageCode == 'ar';

    return Row(
      children: isArabic
          ? [
              BilingualText(
                title: 'المقدمة',
                content: storyPart.arabicContent,
                isArabic: true,
                isFirstPart: isFirstPart,
              ),
              BilingualText(
                title: 'Introduction',
                content: storyPart.englishContent,
                isArabic: false,
                isFirstPart: isFirstPart,
              ),
            ]
          : [
              BilingualText(
                title: 'Introduction',
                content: storyPart.englishContent,
                isArabic: false,
                isFirstPart: isFirstPart,
              ),
              BilingualText(
                title: 'المقدمة',
                content: storyPart.arabicContent,
                isArabic: true,
                isFirstPart: isFirstPart,
              ),
            ],
    );
  }
}

class BilingualText extends StatelessWidget {
  final String title;
  final String content;
  final bool isArabic;
  final bool isFirstPart;

  const BilingualText({
    super.key,
    required this.title,
    required this.content,
    required this.isArabic,
    required this.isFirstPart,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: Insets.smallAll,
          child: Column(
            children: [
              if (isFirstPart) ...[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                const SizedBox(height: 16),
              ],
              Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: isArabic ? 1.8 : 1.6,
                      fontSize: 16,
                      fontWeight: isArabic ? FontWeight.bold : FontWeight.normal,
                      fontFamily: isArabic ? 'thuluth' : null,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
                textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
