import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/listening_practice_models.dart';

class TranslationCard extends HookWidget {
  final ListeningPracticeSentenceModel sentence;
  final String language;
  final bool showTranslation;

  const TranslationCard({
    super.key,
    required this.sentence,
    required this.language,
    this.showTranslation = false,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(showTranslation);

    return Card(
      margin: Insets.noneAll,
      child: Padding(
        padding: Insets.smallAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.translation,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () => isExpanded.value = !isExpanded.value,
                  icon: Icon(isExpanded.value ? Icons.visibility_off : Icons.visibility),
                ),
              ],
            ),
            if (isExpanded.value) ...[
              const Divider(),
              const SizedBox(height: 8),
              Text(
                language == 'ar' ? sentence.arabic : sentence.english,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
