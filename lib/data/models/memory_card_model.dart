// Game State Management

import 'package:lang_bridge/data/models/_models.dart';
part 'memory_card_model.freezed.dart';
part 'memory_card_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum GameStatusEnum {
  @JsonValue('playing')
  playing,
  @JsonValue('completed')
  completed;

  String toJson() => name;

  static GameStatusEnum fromJson(String value) {
    return GameStatusEnum.values.firstWhere(
      (e) => e.name == value,
      orElse: () => GameStatusEnum.playing,
    );
  }
}

@freezed
abstract class MemeoryGameModel with _$MemeoryGameModel {
  @jsonSerializable
  const factory MemeoryGameModel({
    required List<GameCardModel> cards,
    required List<String> flippedCardIds,
    required List<String> matchedCardIds,
    required int moves,
    required int matches,
    required GameStatusEnum status,
    required Duration gameTime,
    required int points,
  }) = _MemeoryGameModel;

  factory MemeoryGameModel.fromJson(Map<String, dynamic> json) => _$MemeoryGameModelFromJson(json);

  static MemeoryGameModel initial() {
    return const MemeoryGameModel(
      cards: [],
      flippedCardIds: [],
      matchedCardIds: [],
      moves: 0,
      matches: 0,
      status: GameStatusEnum.playing,
      gameTime: Duration.zero,
      points: 0,
    );
  }
}

@freezed
abstract class GameCardModel with _$GameCardModel {
  @jsonSerializable
  factory GameCardModel({
    required String id,
    required String pairId,
    required String text,
  }) = _GameCardModel;

  factory GameCardModel.fromJson(Map<String, dynamic> json) => _$GameCardModelFromJson(json);
}
