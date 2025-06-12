import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/providers/leaderboard_provider.dart';

// Podium Widget
class LeaderboardPodium extends StatelessWidget {
  final List<AuthenticationModel> topThree;

  const LeaderboardPodium({
    super.key,
    required this.topThree,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure we have at least 3 users, pad with nulls if needed
    final paddedList = List<AuthenticationModel?>.from(topThree);
    while (paddedList.length < 3) {
      paddedList.add(null);
    }

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _PodiumPlace(
            position: 2,
            user: paddedList.length > 1 ? paddedList[1] : null,
            height: 140,
          ),
          _PodiumPlace(
            position: 1,
            user: paddedList.isNotEmpty ? paddedList[0] : null,
            height: 180,
          ),
          _PodiumPlace(
            position: 3,
            user: paddedList.length > 2 ? paddedList[2] : null,
            height: 120,
          ),
        ],
      ),
    );
  }
}

class _PodiumPlace extends StatelessWidget {
  final int position;
  final AuthenticationModel? user;
  final double height;

  const _PodiumPlace({
    required this.position,
    required this.user,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    Color podiumColor = position == 1
        ? const Color(0xFFFFD700) // Gold
        : position == 2
            ? const Color(0xFFC0C0C0) // Silver
            : const Color(0xFFCD7F32); // Bronze

    if (user == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surface.withOpacity(0.3),
              border: Border.all(color: podiumColor.withOpacity(0.3), width: 3),
            ),
            child: const Icon(Icons.person_outline, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            '---',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onPrimary.withOpacity(0.5),
            ),
          ),
          Text(
            '--- pts',
            style: TextStyle(
              fontSize: 10,
              color: context.colorScheme.onPrimary.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: height / 2,
            decoration: BoxDecoration(
              color: podiumColor.withOpacity(0.3),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Center(
              child: Text(
                '$position',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      );
    }

    final nameParts = user!.fullName.split(' ');
    final initials = nameParts.length >= 2 ? '${nameParts[0][0]}${nameParts[1][0]}' : nameParts[0][0];

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
              initials,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            user!.fullName,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
        Text(
          '${user!.points} pts',
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
}

// Stats Cards Widget
class UserStatsCards extends ConsumerWidget {
  final String currentUserId;

  const UserStatsCards({
    super.key,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(currentUserProvider(currentUserId));
    final rankAsyncValue = ref.watch(cachedUserRankProvider(currentUserId));

    return userAsyncValue.when(
      data: (user) {
        if (user == null) {
          return const _StatsCardsLoading();
        }

        return rankAsyncValue.when(
          data: (rank) => _StatsCardsContent(user: user, rank: rank),
          loading: () => _StatsCardsContent(user: user, rank: null),
          error: (_, __) => _StatsCardsContent(user: user, rank: null),
        );
      },
      loading: () => const _StatsCardsLoading(),
      error: (_, __) => const _StatsCardsError(),
    );
  }
}

class _StatsCardsContent extends StatelessWidget {
  final AuthenticationModel user;
  final int? rank;

  const _StatsCardsContent({
    required this.user,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'Your Rank',
            value: rank != null ? '#$rank' : '...',
            icon: Icons.emoji_events,
            color: context.colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: 'Total Score',
            value: '${user.points}',
            icon: Icons.star,
            color: context.colorScheme.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: 'Streak',
            value: '${user.streak} days',
            icon: Icons.local_fire_department,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class _StatsCardsLoading extends StatelessWidget {
  const _StatsCardsLoading();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StatCardSkeleton()),
        const SizedBox(width: 12),
        Expanded(child: _StatCardSkeleton()),
        const SizedBox(width: 12),
        Expanded(child: _StatCardSkeleton()),
      ],
    );
  }
}

class _StatsCardsError extends StatelessWidget {
  const _StatsCardsError();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: context.colorScheme.onErrorContainer),
          const SizedBox(width: 8),
          Text(
            'Unable to load stats',
            style: TextStyle(color: context.colorScheme.onErrorContainer),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
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
          Icon(icon, color: color, size: 24),
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
}

class _StatCardSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: context.colorScheme.outline.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 18,
            decoration: BoxDecoration(
              color: context.colorScheme.outline.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 60,
            height: 12,
            decoration: BoxDecoration(
              color: context.colorScheme.outline.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

// Leaderboard List Item Widget
class LeaderboardItem extends StatelessWidget {
  final AuthenticationModel user;
  final int rank;
  final bool isCurrentUser;

  const LeaderboardItem({
    super.key,
    required this.user,
    required this.rank,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    final nameParts = user.fullName.split(' ');
    final initials = nameParts.length >= 2 ? '${nameParts[0][0]}${nameParts[1][0]}' : nameParts[0][0];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? context.colorScheme.primaryContainer.withOpacity(0.5)
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
              initials,
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
                  user.fullName,
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
                      '${user.points} ${context.l10n.points.substring(2)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: context.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    if (user.streak > 0) ...[
                      const SizedBox(width: 12),
                      Icon(
                        Icons.local_fire_department,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${user.streak}',
                        style: TextStyle(
                          fontSize: 12,
                          color: context.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
