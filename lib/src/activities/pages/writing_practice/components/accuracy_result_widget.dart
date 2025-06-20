// lib/widgets/accuracy_result_widget.dart
import 'package:flutter/material.dart';

class AccuracyResultWidget extends StatelessWidget {
  final int accuracy;

  const AccuracyResultWidget({
    super.key,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    Color getAccuracyColor() {
      if (accuracy >= 90) return Colors.green;
      if (accuracy >= 70) return Colors.orange;
      return Colors.red;
    }

    IconData getAccuracyIcon() {
      if (accuracy >= 90) return Icons.check_circle;
      if (accuracy >= 70) return Icons.warning;
      return Icons.error;
    }

    String getAccuracyMessage() {
      if (accuracy >= 90) return 'Excellent!';
      if (accuracy >= 70) return 'Good effort!';
      return 'Keep practicing!';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: getAccuracyColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: getAccuracyColor().withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            getAccuracyIcon(),
            color: getAccuracyColor(),
            size: 24,
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Accuracy: $accuracy%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: getAccuracyColor(),
                ),
              ),
              Text(
                getAccuracyMessage(),
                style: TextStyle(
                  fontSize: 14,
                  color: getAccuracyColor().withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
