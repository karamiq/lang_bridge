import 'package:flutter/material.dart';

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
            label: const Text('Reset'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onNext,
            icon: Icon(isLastSentence ? Icons.check : Icons.arrow_forward),
            label: Text(isLastSentence ? 'Finish' : 'Next'),
          ),
        ),
      ],
    );
  }
}
