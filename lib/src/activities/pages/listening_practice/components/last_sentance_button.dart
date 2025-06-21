import 'package:flutter/material.dart';

class LastSentenceButtons extends StatelessWidget {
  final VoidCallback onComplete;
  final VoidCallback onReset;

  const LastSentenceButtons({
    super.key,
    required this.onComplete,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onComplete,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Text(
            'Complete Test',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: onReset,
          child: const Text('Reset Practice'),
        ),
      ],
    );
  }
}
