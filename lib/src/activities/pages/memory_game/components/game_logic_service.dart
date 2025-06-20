import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';

import 'points_caculator.dart';

class GameLogicService {
  static MemeoryGameModel initializeGame(List<CategorynModel> words) {
    final cards = _createGameCards(words);
    return MemeoryGameModel.initial().copyWith(
      cards: cards,
      status: GameStatusEnum.playing,
    );
  }

  static List<GameCardModel> _createGameCards(List<CategorynModel> words) {
    final cards = <GameCardModel>[];
    for (var word in words) {
      cards.add(GameCardModel(
        id: '${word.id}_en',
        pairId: word.id,
        text: word.english,
      ));
      cards.add(GameCardModel(
        id: '${word.id}_ar',
        pairId: word.id,
        text: word.arabic,
      ));
    }
    cards.shuffle();
    return cards;
  }

  static MemeoryGameModel handleCardTap(MemeoryGameModel state, String cardId) {
    // Don't allow tapping if game is not playing or card is already flipped/matched
    // prevent double flips
    if (state.status != GameStatusEnum.playing ||
        state.flippedCardIds.contains(cardId) ||
        state.matchedCardIds.contains(cardId)) {
      return state;
    }

    // Don't allow more than 2 cards to be flipped at once
    if (state.flippedCardIds.length >= 2) {
      return state;
    }

    final newFlippedCards = List<String>.from(state.flippedCardIds)..add(cardId);

    // If this is the first card, just flip it
    if (newFlippedCards.length == 1) {
      return state.copyWith(flippedCardIds: newFlippedCards);
    }

    // If this is the second card, check for match after a brief delay
    if (newFlippedCards.length == 2) {
      return state.copyWith(
        flippedCardIds: newFlippedCards,
        moves: state.moves + 1,
      );
    }

    return state;
  }

  static MemeoryGameModel checkForMatch(MemeoryGameModel state) {
    if (state.flippedCardIds.length != 2) return state;

    final card1 = state.cards.firstWhere((c) => c.id == state.flippedCardIds[0]);
    final card2 = state.cards.firstWhere((c) => c.id == state.flippedCardIds[1]);

    // Check if cards match (same pairId but different languages)
    if (card1.pairId == card2.pairId) {
      // Match found - keep cards flipped and add to matched
      final newMatchedCards = List<String>.from(state.matchedCardIds)..addAll(state.flippedCardIds);
      final newMatches = state.matches + 1;

      // Check if game is completed
      final totalPairs = state.cards.length ~/ 2;
      final isGameCompleted = newMatches == totalPairs;

      int points = state.points;
      GameStatusEnum status = state.status;

      if (isGameCompleted) {
        points = PointsCalculator.calculatePoints(
          moves: state.moves,
          gameTime: state.gameTime,
        );
        status = GameStatusEnum.completed;
      }

      return state.copyWith(
        flippedCardIds: [],
        matchedCardIds: newMatchedCards,
        matches: newMatches,
        points: points,
        status: status,
      );
    } else {
      // No match - cards will remain flipped until timer flips them back
      return state;
    }
  }

  static MemeoryGameModel resetFlippedCards(MemeoryGameModel state) {
    return state.copyWith(flippedCardIds: []);
  }

  static MemeoryGameModel updateGameTime(MemeoryGameModel state, Duration newTime) {
    return state.copyWith(gameTime: newTime);
  }
}
