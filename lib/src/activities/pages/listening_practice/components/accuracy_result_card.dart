import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import '../../../../../data/models/listening_practice_models.dart';

class AccuracyResultCard extends HookWidget {
  final int accuracy;
  final List<WordComparisonModel> wordComparisons;
  final String targetText;
  final String userInput;

  const AccuracyResultCard({
    super.key,
    required this.accuracy,
    required this.wordComparisons,
    required this.targetText,
    required this.userInput,
  });

  @override
  Widget build(BuildContext context) {
    final showDetails = useState(false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.results,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _buildAccuracyBadge(context),
              ],
            ),
            const SizedBox(height: 16),

            // Accuracy visualization
            _buildAccuracyBar(context),
            const SizedBox(height: 16),

            // Toggle details button
            TextButton.icon(
              onPressed: () => showDetails.value = !showDetails.value,
              icon: Icon(showDetails.value ? Icons.expand_less : Icons.expand_more),
              label: Text(
                showDetails.value ? context.l10n.hideDetails : context.l10n.showDetails,
              ),
            ),

            // Detailed comparison
            if (showDetails.value) ...[
              const Divider(),
              _buildDetailedComparison(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAccuracyBadge(BuildContext context) {
    Color badgeColor;
    if (accuracy >= 90) {
      badgeColor = Colors.green;
    } else if (accuracy >= 70) {
      badgeColor = Colors.orange;
    } else {
      badgeColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: badgeColor),
      ),
      child: Text(
        '$accuracy%',
        style: TextStyle(
          color: badgeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAccuracyBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.accuracyPercentage(accuracy),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: accuracy / 100,
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          valueColor: AlwaysStoppedAnimation<Color>(
            accuracy >= 70 ? Colors.green : Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailedComparison(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.correctAnswer,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.withOpacity(0.3)),
          ),
          child: Text(
            targetText,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 12),

        Text(
          context.l10n.yourAnswer,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(userInput.isNotEmpty ? userInput : context.l10n.noAnswerProvided),
        ),
        const SizedBox(height: 12),

        // Word-by-word comparison
        Text(
          context.l10n.wordComparison,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: wordComparisons.map((comparison) {
            return _buildWordChip(context, comparison);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildWordChip(BuildContext context, WordComparisonModel comparison) {
    Color chipColor;
    IconData? icon;

    switch (comparison.type) {
      case WordComparisonType.exact:
        chipColor = Colors.green;
        icon = Icons.check;
        break;
      case WordComparisonType.similar:
        chipColor = Colors.orange;
        icon = Icons.warning;
        break;
      case WordComparisonType.wrong:
        chipColor = Colors.red;
        icon = Icons.close;
        break;
      case WordComparisonType.missing:
        chipColor = Colors.grey;
        icon = Icons.remove;
        break;
      case WordComparisonType.extra:
        chipColor = Colors.purple;
        icon = Icons.add;
        break;
    }

    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: chipColor),
          const SizedBox(width: 4),
          Text(
            comparison.userWord.isNotEmpty ? comparison.userWord : comparison.targetWord,
            style: TextStyle(color: chipColor),
          ),
        ],
      ),
      backgroundColor: chipColor.withOpacity(0.1),
      side: BorderSide(color: chipColor.withOpacity(0.3)),
    );
  }
}
