import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class ActionButtonsRow extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback onReset;
  final bool isLastSentence;
  final bool showCompletionMessage;

  const ActionButtonsRow({
    super.key,
    this.onNext,
    required this.onReset,
    this.isLastSentence = false,
    this.showCompletionMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            label: Text(context.l10n.reset),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onNext,
            icon: Icon(isLastSentence ? Icons.check : Icons.arrow_forward),
            label: Text(isLastSentence ? context.l10n.finish : context.l10n.next),
          ),
        ),
      ],
    );
  }
}
