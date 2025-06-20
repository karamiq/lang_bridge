// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemeoryGameModel _$MemeoryGameModelFromJson(Map<String, dynamic> json) =>
    _MemeoryGameModel(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => GameCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      flippedCardIds: (json['flippedCardIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      matchedCardIds: (json['matchedCardIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      moves: (json['moves'] as num).toInt(),
      matches: (json['matches'] as num).toInt(),
      status: $enumDecode(_$GameStatusEnumEnumMap, json['status']),
      gameTime: Duration(microseconds: (json['gameTime'] as num).toInt()),
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$MemeoryGameModelToJson(_MemeoryGameModel instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
      'flippedCardIds': instance.flippedCardIds,
      'matchedCardIds': instance.matchedCardIds,
      'moves': instance.moves,
      'matches': instance.matches,
      'status': instance.status.toJson(),
      'gameTime': instance.gameTime.inMicroseconds,
      'points': instance.points,
    };

const _$GameStatusEnumEnumMap = {
  GameStatusEnum.playing: 'playing',
  GameStatusEnum.completed: 'completed',
};

_GameCardModel _$GameCardModelFromJson(Map<String, dynamic> json) =>
    _GameCardModel(
      id: json['id'] as String,
      pairId: json['pairId'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$GameCardModelToJson(_GameCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pairId': instance.pairId,
      'text': instance.text,
    };
