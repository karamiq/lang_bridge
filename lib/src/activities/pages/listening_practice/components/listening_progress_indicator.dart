import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lang_bridge/common_lib.dart';

class ListeningProgressIndicator extends HookWidget {
  final int currentIndex;
  final int totalCount;
  final double progress;

  const ListeningProgressIndicator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );
    final animation = useAnimation(
      Tween<double>(begin: 0, end: progress).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
    );

    useEffect(() {
      animationController.forward();
      return null;
    }, [progress]);

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
                  context.l10n.listeningProgressQuestion(
                    (currentIndex + 1).toString(),
                    totalCount.toString(),
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: animation,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
