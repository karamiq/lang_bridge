import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class WritingInputCard extends HookWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool hasSubmitted;
  final bool enabled;

  const WritingInputCard({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.hasSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final wordCount = useState(0);

    useEffect(() {
      void updateWordCount() {
        final text = controller.text.trim();
        wordCount.value = text.isEmpty ? 0 : text.split(' ').length;
      }

      controller.addListener(updateWordCount);
      return () => controller.removeListener(updateWordCount);
    }, [controller]);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.yourAnswer,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              focusNode: focusNode,
              enabled: enabled,
              maxLines: 4,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: context.l10n.typeWhatYouHeard,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: hasSubmitted ? Theme.of(context).colorScheme.surfaceVariant : null,
              ),
              onChanged: onChanged,
              onSubmitted: enabled ? (_) => {} : null,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.wordsCount(wordCount.value.toString()),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (hasSubmitted)
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
