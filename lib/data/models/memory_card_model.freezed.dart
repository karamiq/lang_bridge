// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemeoryGameModel {
  List<GameCardModel> get cards;
  List<String> get flippedCardIds;
  List<String> get matchedCardIds;
  int get moves;
  int get matches;
  GameStatusEnum get status;
  Duration get gameTime;
  int get points;

  /// Create a copy of MemeoryGameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemeoryGameModelCopyWith<MemeoryGameModel> get copyWith =>
      _$MemeoryGameModelCopyWithImpl<MemeoryGameModel>(
          this as MemeoryGameModel, _$identity);

  /// Serializes this MemeoryGameModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemeoryGameModel &&
            const DeepCollectionEquality().equals(other.cards, cards) &&
            const DeepCollectionEquality()
                .equals(other.flippedCardIds, flippedCardIds) &&
            const DeepCollectionEquality()
                .equals(other.matchedCardIds, matchedCardIds) &&
            (identical(other.moves, moves) || other.moves == moves) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gameTime, gameTime) ||
                other.gameTime == gameTime) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cards),
      const DeepCollectionEquality().hash(flippedCardIds),
      const DeepCollectionEquality().hash(matchedCardIds),
      moves,
      matches,
      status,
      gameTime,
      points);

  @override
  String toString() {
    return 'MemeoryGameModel(cards: $cards, flippedCardIds: $flippedCardIds, matchedCardIds: $matchedCardIds, moves: $moves, matches: $matches, status: $status, gameTime: $gameTime, points: $points)';
  }
}

/// @nodoc
abstract mixin class $MemeoryGameModelCopyWith<$Res> {
  factory $MemeoryGameModelCopyWith(
          MemeoryGameModel value, $Res Function(MemeoryGameModel) _then) =
      _$MemeoryGameModelCopyWithImpl;
  @useResult
  $Res call(
      {List<GameCardModel> cards,
      List<String> flippedCardIds,
      List<String> matchedCardIds,
      int moves,
      int matches,
      GameStatusEnum status,
      Duration gameTime,
      int points});
}

/// @nodoc
class _$MemeoryGameModelCopyWithImpl<$Res>
    implements $MemeoryGameModelCopyWith<$Res> {
  _$MemeoryGameModelCopyWithImpl(this._self, this._then);

  final MemeoryGameModel _self;
  final $Res Function(MemeoryGameModel) _then;

  /// Create a copy of MemeoryGameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? flippedCardIds = null,
    Object? matchedCardIds = null,
    Object? moves = null,
    Object? matches = null,
    Object? status = null,
    Object? gameTime = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      cards: null == cards
          ? _self.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameCardModel>,
      flippedCardIds: null == flippedCardIds
          ? _self.flippedCardIds
          : flippedCardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matchedCardIds: null == matchedCardIds
          ? _self.matchedCardIds
          : matchedCardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      moves: null == moves
          ? _self.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as int,
      matches: null == matches
          ? _self.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatusEnum,
      gameTime: null == gameTime
          ? _self.gameTime
          : gameTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _MemeoryGameModel implements MemeoryGameModel {
  const _MemeoryGameModel(
      {required final List<GameCardModel> cards,
      required final List<String> flippedCardIds,
      required final List<String> matchedCardIds,
      required this.moves,
      required this.matches,
      required this.status,
      required this.gameTime,
      required this.points})
      : _cards = cards,
        _flippedCardIds = flippedCardIds,
        _matchedCardIds = matchedCardIds;
  factory _MemeoryGameModel.fromJson(Map<String, dynamic> json) =>
      _$MemeoryGameModelFromJson(json);

  final List<GameCardModel> _cards;
  @override
  List<GameCardModel> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  final List<String> _flippedCardIds;
  @override
  List<String> get flippedCardIds {
    if (_flippedCardIds is EqualUnmodifiableListView) return _flippedCardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flippedCardIds);
  }

  final List<String> _matchedCardIds;
  @override
  List<String> get matchedCardIds {
    if (_matchedCardIds is EqualUnmodifiableListView) return _matchedCardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedCardIds);
  }

  @override
  final int moves;
  @override
  final int matches;
  @override
  final GameStatusEnum status;
  @override
  final Duration gameTime;
  @override
  final int points;

  /// Create a copy of MemeoryGameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemeoryGameModelCopyWith<_MemeoryGameModel> get copyWith =>
      __$MemeoryGameModelCopyWithImpl<_MemeoryGameModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemeoryGameModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemeoryGameModel &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality()
                .equals(other._flippedCardIds, _flippedCardIds) &&
            const DeepCollectionEquality()
                .equals(other._matchedCardIds, _matchedCardIds) &&
            (identical(other.moves, moves) || other.moves == moves) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gameTime, gameTime) ||
                other.gameTime == gameTime) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_flippedCardIds),
      const DeepCollectionEquality().hash(_matchedCardIds),
      moves,
      matches,
      status,
      gameTime,
      points);

  @override
  String toString() {
    return 'MemeoryGameModel(cards: $cards, flippedCardIds: $flippedCardIds, matchedCardIds: $matchedCardIds, moves: $moves, matches: $matches, status: $status, gameTime: $gameTime, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$MemeoryGameModelCopyWith<$Res>
    implements $MemeoryGameModelCopyWith<$Res> {
  factory _$MemeoryGameModelCopyWith(
          _MemeoryGameModel value, $Res Function(_MemeoryGameModel) _then) =
      __$MemeoryGameModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<GameCardModel> cards,
      List<String> flippedCardIds,
      List<String> matchedCardIds,
      int moves,
      int matches,
      GameStatusEnum status,
      Duration gameTime,
      int points});
}

/// @nodoc
class __$MemeoryGameModelCopyWithImpl<$Res>
    implements _$MemeoryGameModelCopyWith<$Res> {
  __$MemeoryGameModelCopyWithImpl(this._self, this._then);

  final _MemeoryGameModel _self;
  final $Res Function(_MemeoryGameModel) _then;

  /// Create a copy of MemeoryGameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cards = null,
    Object? flippedCardIds = null,
    Object? matchedCardIds = null,
    Object? moves = null,
    Object? matches = null,
    Object? status = null,
    Object? gameTime = null,
    Object? points = null,
  }) {
    return _then(_MemeoryGameModel(
      cards: null == cards
          ? _self._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameCardModel>,
      flippedCardIds: null == flippedCardIds
          ? _self._flippedCardIds
          : flippedCardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matchedCardIds: null == matchedCardIds
          ? _self._matchedCardIds
          : matchedCardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      moves: null == moves
          ? _self.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as int,
      matches: null == matches
          ? _self.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatusEnum,
      gameTime: null == gameTime
          ? _self.gameTime
          : gameTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$GameCardModel {
  String get id;
  String get pairId;
  String get text;

  /// Create a copy of GameCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameCardModelCopyWith<GameCardModel> get copyWith =>
      _$GameCardModelCopyWithImpl<GameCardModel>(
          this as GameCardModel, _$identity);

  /// Serializes this GameCardModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameCardModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pairId, pairId) || other.pairId == pairId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pairId, text);

  @override
  String toString() {
    return 'GameCardModel(id: $id, pairId: $pairId, text: $text)';
  }
}

/// @nodoc
abstract mixin class $GameCardModelCopyWith<$Res> {
  factory $GameCardModelCopyWith(
          GameCardModel value, $Res Function(GameCardModel) _then) =
      _$GameCardModelCopyWithImpl;
  @useResult
  $Res call({String id, String pairId, String text});
}

/// @nodoc
class _$GameCardModelCopyWithImpl<$Res>
    implements $GameCardModelCopyWith<$Res> {
  _$GameCardModelCopyWithImpl(this._self, this._then);

  final GameCardModel _self;
  final $Res Function(GameCardModel) _then;

  /// Create a copy of GameCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pairId = null,
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pairId: null == pairId
          ? _self.pairId
          : pairId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _GameCardModel implements GameCardModel {
  _GameCardModel({required this.id, required this.pairId, required this.text});
  factory _GameCardModel.fromJson(Map<String, dynamic> json) =>
      _$GameCardModelFromJson(json);

  @override
  final String id;
  @override
  final String pairId;
  @override
  final String text;

  /// Create a copy of GameCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameCardModelCopyWith<_GameCardModel> get copyWith =>
      __$GameCardModelCopyWithImpl<_GameCardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GameCardModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameCardModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pairId, pairId) || other.pairId == pairId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pairId, text);

  @override
  String toString() {
    return 'GameCardModel(id: $id, pairId: $pairId, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$GameCardModelCopyWith<$Res>
    implements $GameCardModelCopyWith<$Res> {
  factory _$GameCardModelCopyWith(
          _GameCardModel value, $Res Function(_GameCardModel) _then) =
      __$GameCardModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String pairId, String text});
}

/// @nodoc
class __$GameCardModelCopyWithImpl<$Res>
    implements _$GameCardModelCopyWith<$Res> {
  __$GameCardModelCopyWithImpl(this._self, this._then);

  final _GameCardModel _self;
  final $Res Function(_GameCardModel) _then;

  /// Create a copy of GameCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? pairId = null,
    Object? text = null,
  }) {
    return _then(_GameCardModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pairId: null == pairId
          ? _self.pairId
          : pairId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
