import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/providers/leaderboard_provider.dart';
import 'package:lang_bridge/src/leaderboard/components/leaderboard_widgets.dart';
import 'package:lang_bridge/src/leaderboard/components/podium.dart';

class LeaderboardPage extends HookConsumerWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ref.watch(currentUserRankProvider).when(
              data: (rank) => SizedBox(
                height: 90,
                child: LeaderboardItem(
                  isCurrentUser: true,
                  rank: rank,
                  user: ref.watch(authenticationProvider)!,
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => ElevatedButton(
                onPressed: () {
                  // ignore: unused_result
                  ref.invalidate(currentUserRankProvider);
                },
                child: Text(context.l10n.retry),
              ),
            ),
        backgroundColor: context.colorScheme.surface,
        body: ref.watch(leaderboardTopPerformancersProvider).when(
            error: (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.defaultErrorMessage,
                        style: TextStyle(
                          fontSize: 18,
                          color: context.colorScheme.error,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // ignore: unused_result
                          ref.refresh(leaderboardTopPerformancersProvider);
                        },
                        child: Text(context.l10n.retry),
                      ),
                    ],
                  ),
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (users) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: Insets.medium),
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
                            context.l10n.topPerformers,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Podium(context: context, users: users.take(3).toList()),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          LeaderboardItem(isCurrentUser: false, rank: index + 3, user: users[index]),
                      childCount: users.length - 3,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                    ),
                  ),
                ],
              );
            }));
  }
}
