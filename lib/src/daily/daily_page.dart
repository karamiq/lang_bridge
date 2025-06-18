import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/daily_progress_model.dart';
import 'package:lang_bridge/data/providers/daily_provider.dart';
import 'package:lang_bridge/src/daily/components/challenge_grid.dart';
import 'package:lang_bridge/src/daily/components/completion_card.dart';
import 'package:lang_bridge/src/daily/components/daily_quiz_card.dart';
import 'package:lang_bridge/src/daily/components/daily_word_card.dart';
import 'package:lang_bridge/src/daily/components/progress_overview.dart';
import 'package:lang_bridge/src/daily/components/saying_carousel.dart';
import 'package:lang_bridge/src/daily/components/vcabulary_review_card.dart';

class DailyPage extends ConsumerWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyProgressAsync = ref.watch(dailyProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: dailyProgressAsync.when(
        data: (progress) => DailyContent(progress: progress),
        loading: () => const LoadingView(),
        error: (error, stack) => ErrorView(error: error),
      ),
    );
  }
}

class DailyContent extends HookConsumerWidget {
  final DailyProgressModel progress;

  const DailyContent({super.key, required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressList = useState<List<bool>>([false, false, false, false]);
    useEffect(() {
      if (progress.isComplete) {
        progressList.value = [true, true, true, true];
      } else {
        // Only reset if all are false (fresh load)
        final allFalse = progressList.value.every((e) => !e);
        if (allFalse) {
          progressList.value = [false, false, false, false];
        }
      }
      return null;
    }, []);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(Insets.medium),
          sliver: SliverToBoxAdapter(
              child: ref.watch(dailySayingProvider).when(
                  data: (data) {
                    return SayingsCarousel(
                      sayings: data,
                    );
                  },
                  error: (error, stack) => Text(
                        context.l10n.defaultErrorMessage,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ProgressOverview(
                completedChallenges: progressList.value,
                totalPoints: progress.totalPoints,
              ),
              ChallengesGrid(
                completedChallenges: progressList.value,
                progress: progress,
              ),
              const SizedBox(height: 12),
              CurrentChallengeDetail(
                  progress: progress,
                  progressList: progressList,
                  onComplete: (progress) async {
                    // ignore: unused_result
                    await ref.read(updateProgressProvider.notifier).run(progress);
                  }),
              const SizedBox(height: Insets.medium),
            ]),
          ),
        ),
      ],
    );
  }
}

class CurrentChallengeDetail extends HookConsumerWidget {
  final DailyProgressModel progress;
  final ValueNotifier<List<bool>> progressList;

  const CurrentChallengeDetail({
    super.key,
    required this.progress,
    required this.progressList,
    required this.onComplete,
  });

  final Function(DailyProgressModel progress) onComplete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = useState<int>(0);

    useEffect(() {
      // Navigate to the first incomplete challenge
      final next = progressList.value.indexWhere((e) => !e);
      pageIndex.value = next != -1 ? next : 4;
      return null;
    }, [progressList.value]);

    Future<void> completeStep(int index) async {
      final updated = [...progressList.value];
      updated[index] = true;
      progressList.value = updated;

      final next = updated.indexWhere((e) => !e);
      if (next == -1) {
        await onComplete(progress); // All challenges completed
        // ignore: unused_result

        pageIndex.value = 4; // completion
      } else {
        pageIndex.value = next;
      }
    }

    if (progress.isComplete) {
      return CompletionCard(totalPoints: progress.totalPoints);
    }

    switch (pageIndex.value) {
      case 0:
        return DailyWordCard(
          title: context.l10n.dailyWordChallenge,
          icon: Icons.school,
          arabicWord: progress.currentWord.arabicWord,
          englishWord: progress.currentWord.englishWord,
          pronunciation: progress.currentWord.pronunciation,
          exampleArabic: progress.currentWord.exampleArabic,
          exampleEnglish: progress.currentWord.exampleEnglish,
          points: progress.currentWord.points,
          onComplete: () => completeStep(0),
          onPlayAudio: () {},
        );
      case 1:
        return DailyQuizCard(
          quizQuestions: progress.currentQuizQuestion,
          onComplete: () => completeStep(1),
        );
      case 2:
        return DailyWordCard(
          title: context.l10n.dailyPhraseChallenge,
          icon: Icons.chat_sharp,
          arabicWord: progress.currentPhrase.arabicPhrase,
          englishWord: progress.currentPhrase.englishPhrase,
          pronunciation: progress.currentPhrase.pronunciation,
          exampleArabic: progress.currentPhrase.responseArabic,
          exampleEnglish: progress.currentPhrase.responseEnglish,
          points: progress.currentPhrase.points,
          onComplete: () => completeStep(2),
          onPlayAudio: () {},
        );
      case 3:
        return VocabularyReviewCard(
          vocabularyBank: progress.vocabularyEntries,
          onPlayAudio: () {},
          onComplete: () => completeStep(3),
        );
      default:
        return CompletionCard(totalPoints: progress.totalPoints);
    }
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  final Object error;

  const ErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.defaultErrorMessage,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
