// components/progress_overview.dart
import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class ProgressOverview extends StatelessWidget {
  final List<bool> completedChallenges;
  final int totalPoints;
  final VoidCallback? onTap;

  const ProgressOverview({
    super.key,
    required this.completedChallenges,
    required this.totalPoints,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final completedCount = completedChallenges.where((c) => c).length;
    final progress = completedCount / completedChallenges.length;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildProgressCircle(progress, colorScheme),
            const SizedBox(width: 16),
            Expanded(
              child: _buildProgressStats(
                context,
                completedCount,
                colorScheme,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCircle(double progress, ColorScheme colorScheme) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 6,
            backgroundColor: colorScheme.outline.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              '${(progress * 100).round()}%',
              key: ValueKey(progress),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStats(BuildContext context, int completedCount, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.l10n.todaysProgress,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.challengesCompleted(completedCount, completedChallenges.length),
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 4),
        _buildPointsDisplay(context),
      ],
    );
  }

  Widget _buildPointsDisplay(BuildContext context) {
    Widget pointsWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.stars,
            size: 12,
            color: context.colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            '$totalPoints ${context.l10n.points}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );

    return pointsWidget;
  }
}
