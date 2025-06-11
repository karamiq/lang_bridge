import 'package:flutter/material.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Daily Challenge',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Learn a new word every day',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Daily Challenge',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '⭐',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Today\'s word to learn:',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lion',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        // Play pronunciation
                      },
                      icon: Icon(
                        Icons.volume_up,
                        color: colorScheme.primary,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      // Mark as learned
                    },
                    child: const Text('I\'ve Learned This Word!'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Column(
              children: [
                Text(
                  'Demo Mode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add sample users to the leaderboard for demonstration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    // Add demo users
                  },
                  child: const Text('Add Demo Users'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
