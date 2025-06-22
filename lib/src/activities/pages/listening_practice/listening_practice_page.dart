import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/listening_practice_models.dart';
import 'package:lang_bridge/data/providers/activities_provider.dart';
import 'package:lang_bridge/data/providers/listening_practice_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/accuracy_result_card.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/action_button_row.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/audio_player_card.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/completion_widgets.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/listening_progress_indicator.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/loading_and_error.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/logic.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/result_widget.dart';
import 'package:lang_bridge/src/activities/pages/listening_practice/components/translation_card.dart';

class ListeningPracticePage extends HookConsumerWidget {
  const ListeningPracticePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.read(settingsProvider).locale.languageCode;
    final sentencesAsync = ref.watch(listeningPracticeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.listeningPracticeTitle),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: sentencesAsync.when(
        data: (sentences) => PracticeContent(
          sentences: sentences,
          languageCode: languageCode,
        ),
        loading: () => const LoadingDisplay(),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.refresh(listeningPracticeProvider),
        ),
      ),
    );
  }
}

class PracticeContent extends HookConsumerWidget {
  final List<ListeningPracticeSentenceModel> sentences;
  final String languageCode;

  const PracticeContent({
    super.key,
    required this.sentences,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = useMemoized(() => ListeningPracticeLogic());
    final userInputController = useTextEditingController();

    final currentSentenceIndex = useState(0);
    final accuracy = useState(0);
    final totalPoints = useState(0);
    final hasSubmitted = useState(false);
    final testCompleted = useState(false);
    final wordComparisons = useState<List<WordComparisonModel>>([]);
    final sentenceAccuracies = useState<List<int>>([]);

    final sentenceResults = useState<List<SentenceResultModel>>([]);
    final testStartTime = useState<DateTime?>(null);
    final sentenceStartTime = useState<DateTime?>(null);
    final sentenceAttempts = useState(0);

    final isTextPresent = useState(false);

    // Initialize test start time
    useEffect(() {
      testStartTime.value = DateTime.now();
      sentenceStartTime.value = DateTime.now();
      return null;
    }, []);

    void performPointsReward(ListeningPracticePerformanceModel performance) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CompletionDialog(
          performance: performance,
          onConfirm: () {
            context.pop();
            // ignore: unused_result
            ref.read(activitiesProvider.notifier).listening(performance);
          },
        ),
      );
    }

    void completeTest() {
      if (sentenceAccuracies.value.isEmpty) {
        return;
      }
      final averageAccuracy =
          sentenceAccuracies.value.reduce((a, b) => a + b) / sentenceAccuracies.value.length;
      final calculatedPoints = logic.calculatePoints(averageAccuracy.round());
      final currentTime = DateTime.now();
      final totalTimeSpent =
          testStartTime.value != null ? currentTime.difference(testStartTime.value!) : Duration.zero;

      final performanceModel = ListeningPracticePerformanceModel(
        completedAt: currentTime,
        languageCode: languageCode,
        totalSentences: sentences.length,
        averageAccuracy: averageAccuracy.round(),
        totalPoints: calculatedPoints,
        sentencePerformances: sentences,
        totalTimeSpent: totalTimeSpent,
      );

      totalPoints.value = calculatedPoints;
      testCompleted.value = true;

      Future.microtask(() => performPointsReward(performanceModel));
    }

    void submitWriting(String targetText) {
      if (userInputController.text.trim().isEmpty) return;

      final currentSentence = sentences[currentSentenceIndex.value];
      final calculatedAccuracy = logic.calculateAccuracy(targetText, userInputController.text);
      final comparisons = logic.generateWordComparisons(targetText, userInputController.text);
      final currentTime = DateTime.now();

      sentenceAttempts.value++;
      final sentenceResult = SentenceResultModel(
        sentenceId: currentSentence.id,
        userInput: userInputController.text.trim(),
        targetText: targetText,
        accuracy: calculatedAccuracy,
        wordComparisons: comparisons,
        completedAt: currentTime,
        attempts: sentenceAttempts.value,
      );

      accuracy.value = calculatedAccuracy;
      wordComparisons.value = comparisons;
      hasSubmitted.value = true;
      sentenceAccuracies.value = [...sentenceAccuracies.value, calculatedAccuracy];
      sentenceResults.value = [...sentenceResults.value, sentenceResult];

      HapticFeedback.mediumImpact();

      // Auto-complete test if this is the last sentence
      if (currentSentenceIndex.value == sentences.length - 1) {
        Future.microtask(() => completeTest());
      }
    }

    void nextSentence() {
      if (currentSentenceIndex.value < sentences.length - 1) {
        currentSentenceIndex.value++;
        userInputController.clear();
        userInputController.text = '';
        hasSubmitted.value = false;
        wordComparisons.value = [];
        accuracy.value = 0;
        sentenceAttempts.value = 0;
        sentenceStartTime.value = DateTime.now();
      } else {
        completeTest();
      }
    }

    void resetPractice() {
      currentSentenceIndex.value = 0;
      userInputController.clear();
      userInputController.text = '';
      hasSubmitted.value = false;
      wordComparisons.value = [];
      accuracy.value = 0;
      totalPoints.value = 0;
      testCompleted.value = false;
      sentenceAccuracies.value = [];
      sentenceResults.value = [];
      sentenceAttempts.value = 0;
      // Reset timing
      testStartTime.value = DateTime.now();
      sentenceStartTime.value = DateTime.now();
      // ignore: unused_result
      ref.refresh(listeningPracticeProvider);
    }

    final currentSentence = sentences[currentSentenceIndex.value];
    final isLastSentence = currentSentenceIndex.value == sentences.length - 1;

    return SingleChildScrollView(
      padding: Insets.mediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListeningProgressIndicator(
            currentIndex: currentSentenceIndex.value,
            totalCount: sentences.length,
            progress: (currentSentenceIndex.value + (hasSubmitted.value ? 1 : 0)) / sentences.length,
          ),
          const Gap(Insets.small),
          AudioPlayerCard(
            language: languageCode,
            sentence: currentSentence,
          ),
          const Gap(Insets.extraSmall),
          WritingInputCard(
            onChanged: (value) {
              if (hasSubmitted.value) {
                hasSubmitted.value = false;
                accuracy.value = 0;
                wordComparisons.value = [];
              }
              isTextPresent.value = value.trim().isNotEmpty;
            },
            controller: userInputController,
            hasSubmitted: hasSubmitted.value,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: isTextPresent.value && !testCompleted.value && !hasSubmitted.value
                ? () => submitWriting(currentSentence.english)
                : null,
            child: Text(context.l10n.submit),
          ),
          const Gap(Insets.small),
          AccuracyResultCard(
            userInput: userInputController.text.trim(),
            accuracy: accuracy.value,
            wordComparisons: wordComparisons.value,
            targetText: currentSentence.english,
          ),
          if (hasSubmitted.value && !testCompleted.value) ...[
            const SizedBox(height: 16),
            if (isLastSentence) ...[
              ElevatedButton(
                onPressed: completeTest,
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
                onPressed: resetPractice,
                child: Text('Reset Practice'),
              ),
            ] else ...[
              ActionButtonsRow(
                onNext: nextSentence,
                onReset: resetPractice,
              ),
            ],
          ],
          if (testCompleted.value) ...[
            const Gap(Insets.small),
            TestCompletionCard(totalPoints: totalPoints.value, onStartNew: resetPractice),
          ],
          const Gap(Insets.small),
          TranslationCard(
            language: languageCode,
            sentence: currentSentence,
          ),
        ],
      ),
    );
  }
}
