import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';
import 'package:lang_bridge/data/providers/activities_provider.dart';
import 'package:lang_bridge/data/providers/categories_provider.dart';
import 'package:lang_bridge/src/activities/pages/memory_game/components/game_completion_dialog.dart';
import 'package:lang_bridge/src/activities/pages/memory_game/components/game_logic_service.dart';
import 'package:lang_bridge/src/activities/pages/memory_game/components/game_status.dart';
import 'package:lang_bridge/src/activities/pages/memory_game/components/memory_game_card.dart';

class MemoryGamePage extends HookConsumerWidget {
  const MemoryGamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider(limit: 8));

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.memoryGameTitle),
      ),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('${context.l10n.defaultErrorMessage}\n$err')),
        data: (words) => _MemoryGame(words: words),
      ),
    );
  }
}

class _MemoryGame extends HookConsumerWidget {
  const _MemoryGame({required this.words});
  final List<CategorynModel> words;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = useState(GameLogicService.initializeGame(words));
    final gameStartTime = useRef(DateTime.now());
    final flipBackTimer = useRef<Timer?>(null);
    final gameTimer = useRef<Timer?>(null);

    useEffect(() {
      gameTimer.value = Timer.periodic(const Duration(seconds: 1), (_) {
        if (gameState.value.status == GameStatusEnum.playing) {
          final elapsed = DateTime.now().difference(gameStartTime.value);
          gameState.value = GameLogicService.updateGameTime(gameState.value, elapsed);
        }
      });

      return () {
        gameTimer.value?.cancel();
        flipBackTimer.value?.cancel();
      };
    }, []);

    void restartGame() {
      gameTimer.value?.cancel();
      flipBackTimer.value?.cancel();
      gameState.value = GameLogicService.initializeGame(words);
      gameStartTime.value = DateTime.now();

      gameTimer.value = Timer.periodic(const Duration(seconds: 1), (_) {
        final elapsed = DateTime.now().difference(gameStartTime.value);
        gameState.value = GameLogicService.updateGameTime(gameState.value, elapsed);
      });
    }

    void handleCardTap(String cardId) {
      gameState.value = GameLogicService.handleCardTap(gameState.value, cardId);

      if (gameState.value.flippedCardIds.length == 2) {
        flipBackTimer.value?.cancel();
        flipBackTimer.value = Timer(const Duration(milliseconds: 500), () {
          final result = GameLogicService.checkForMatch(gameState.value);

          if (result.matches > gameState.value.matches) {
            gameState.value = result;
          } else {
            gameState.value = GameLogicService.resetFlippedCards(gameState.value);
          }

          if (gameState.value.status == GameStatusEnum.completed) {
            gameTimer.value?.cancel();
            Future.delayed(const Duration(milliseconds: 500), () {
              // ignore: unused_result
              ref.read(activitiesProvider.notifier).memory(gameState.value);
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => GameCompletionDialog(
                  gameState: gameState.value,
                  onPlayAgain: () {
                    Navigator.of(context).pop();
                    restartGame();
                  },
                  onFinish: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              );
            });
          }
        });
      }
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: GameStatus(gameState: gameState.value)),
        SliverPadding(
          padding: Insets.smallAll,
          sliver: SliverToBoxAdapter(
            child: Text(
              context.l10n.matchWordsInstruction,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverPadding(
          padding: Insets.mediumAll,
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final card = gameState.value.cards[index];
                final isFlipped = gameState.value.flippedCardIds.contains(card.id) ||
                    gameState.value.matchedCardIds.contains(card.id);
                final isMatched = gameState.value.matchedCardIds.contains(card.id);

                return MemoryGameCard(
                  card: card,
                  isFlipped: isFlipped,
                  isMatched: isMatched,
                  onTap: () => handleCardTap(card.id),
                );
              },
              childCount: gameState.value.cards.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}
