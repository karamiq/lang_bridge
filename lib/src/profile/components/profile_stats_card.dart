import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/shared_preference/shared_preferences_lib.dart';
import 'package:lang_bridge/src/profile/components/stat_item.dart';

class ProfileStatsCard extends ConsumerWidget {
  final AuthenticationModel profile;

  const ProfileStatsCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final userRank = ref.watch(sharedPreferencesProvider).getInt(Preferences.userRankCache) ?? 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatItem(
            label: context.l10n.points,
            value: profile.points.toString(),
          ),
          StatItem(
            label: context.l10n.streak,
            value: profile.streak.toString(),
          ),
          StatItem(
            label: context.l10n.rank,
            value: '$userRank#',
          ),
        ],
      ),
    );
  }
}
