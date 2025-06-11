import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          context.l10n.leaderboard,
          style: TextStyle(
            color: AppColors.background,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.colorScheme.primary,
                    context.colorScheme.primary.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Top Performers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildPodium(context),
                ],
              ),
            ),
          ),

          // Stats Overview
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Progress',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildStatsCards(context),
                  const SizedBox(height: 24),
                  Text(
                    'All Rankings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // Leaderboard List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildLeaderboardItem(context, index + 4),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodium(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPodiumPlace(context, 2, 'Sarah M.', 2840, 140),
          _buildPodiumPlace(context, 1, 'Alex K.', 3250, 180),
          _buildPodiumPlace(context, 3, 'Mike R.', 2650, 120),
        ],
      ),
    );
  }

  Widget _buildPodiumPlace(BuildContext context, int position, String name, int score, double height) {
    Color podiumColor = position == 1
        ? const Color(0xFFFFD700) // Gold
        : position == 2
            ? const Color(0xFFC0C0C0) // Silver
            : const Color(0xFFCD7F32); // Bronze

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.surface,
            border: Border.all(color: podiumColor, width: 3),
          ),
          child: Center(
            child: Text(
              name.split(' ')[0][0] + name.split(' ')[1][0],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onPrimary,
          ),
        ),
        Text(
          '$score pts',
          style: TextStyle(
            fontSize: 10,
            color: context.colorScheme.onPrimary.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: height / 2,
          decoration: BoxDecoration(
            color: podiumColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              '$position',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            'Your Rank',
            '#12',
            Icons.emoji_events,
            context.colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            'Total Score',
            '1,850',
            Icons.star,
            context.colorScheme.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            'Streak',
            '7 days',
            Icons.local_fire_department,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(BuildContext context, int rank) {
    final users = [
      {'name': 'Emma Johnson', 'score': 2420, 'change': '+2'},
      {'name': 'David Chen', 'score': 2380, 'change': '-1'},
      {'name': 'Lisa Garcia', 'score': 2350, 'change': '+1'},
      {'name': 'Tom Wilson', 'score': 2290, 'change': '+3'},
      {'name': 'Anna Brown', 'score': 2250, 'change': '-2'},
      {'name': 'James Davis', 'score': 2180, 'change': '+1'},
      {'name': 'Maria Lopez', 'score': 2150, 'change': '+4'},
      {'name': 'John Smith', 'score': 2120, 'change': '-1'},
      {'name': 'Sophie Taylor', 'score': 2080, 'change': '+2'},
      {'name': 'Chris Anderson', 'score': 2050, 'change': '-3'},
      {'name': 'Rachel White', 'score': 2020, 'change': '+1'},
      {'name': 'Mark Thompson', 'score': 1990, 'change': '+2'},
      {'name': 'You', 'score': 1850, 'change': '+5'}, // User's position
      {'name': 'Julia Martin', 'score': 1820, 'change': '-1'},
      {'name': 'Kevin Lee', 'score': 1790, 'change': '+1'},
      {'name': 'Amy Clark', 'score': 1760, 'change': '-2'},
      {'name': 'Ryan Hall', 'score': 1730, 'change': '+3'},
      {'name': 'Nina Rodriguez', 'score': 1700, 'change': '+1'},
      {'name': 'Ben Allen', 'score': 1670, 'change': '-1'},
      {'name': 'Kate Young', 'score': 1640, 'change': '+2'},
    ];

    final user = users[(rank - 4) % users.length];
    final isCurrentUser = user['name'] == 'You';
    final changeValue = int.parse(user['change'].toString().replaceAll('+', '').replaceAll('-', ''));
    final isPositiveChange = user['change'].toString().startsWith('+');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? context.colorScheme.primaryContainer.withOpacity(0.3)
            : context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrentUser ? context.colorScheme.primary : context.colorScheme.outline.withOpacity(0.2),
          width: isCurrentUser ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isCurrentUser ? context.colorScheme.primary : context.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$rank',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCurrentUser ? context.colorScheme.onPrimary : context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: context.colorScheme.primary.withOpacity(0.1),
            child: Text(
              user['name'].toString().split(' ').map((e) => e[0]).join(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Name and details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'].toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.w600,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: context.colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${user['score']} points',
                      style: TextStyle(
                        fontSize: 12,
                        color: context.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Change indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isPositiveChange ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositiveChange ? Icons.trending_up : Icons.trending_down,
                  size: 12,
                  color: isPositiveChange ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 2),
                Text(
                  changeValue.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isPositiveChange ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
