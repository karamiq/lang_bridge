// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listening_practice_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListeningPracticePerformanceModel {
  DateTime get completedAt;
  String get languageCode;
  int get totalSentences;
  int get averageAccuracy;
  int get totalPoints;
  List<ListeningPracticeSentenceModel> get sentencePerformances;
  Duration get totalTimeSpent;

  /// Create a copy of ListeningPracticePerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListeningPracticePerformanceModelCopyWith<ListeningPracticePerformanceModel>
      get copyWith => _$ListeningPracticePerformanceModelCopyWithImpl<
              ListeningPracticePerformanceModel>(
          this as ListeningPracticePerformanceModel, _$identity);

  /// Serializes this ListeningPracticePerformanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListeningPracticePerformanceModel &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.totalSentences, totalSentences) ||
                other.totalSentences == totalSentences) &&
            (identical(other.averageAccuracy, averageAccuracy) ||
                other.averageAccuracy == averageAccuracy) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            const DeepCollectionEquality()
                .equals(other.sentencePerformances, sentencePerformances) &&
            (identical(other.totalTimeSpent, totalTimeSpent) ||
                other.totalTimeSpent == totalTimeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      completedAt,
      languageCode,
      totalSentences,
      averageAccuracy,
      totalPoints,
      const DeepCollectionEquality().hash(sentencePerformances),
      totalTimeSpent);

  @override
  String toString() {
    return 'ListeningPracticePerformanceModel(completedAt: $completedAt, languageCode: $languageCode, totalSentences: $totalSentences, averageAccuracy: $averageAccuracy, totalPoints: $totalPoints, sentencePerformances: $sentencePerformances, totalTimeSpent: $totalTimeSpent)';
  }
}

/// @nodoc
abstract mixin class $ListeningPracticePerformanceModelCopyWith<$Res> {
  factory $ListeningPracticePerformanceModelCopyWith(
          ListeningPracticePerformanceModel value,
          $Res Function(ListeningPracticePerformanceModel) _then) =
      _$ListeningPracticePerformanceModelCopyWithImpl;
  @useResult
  $Res call(
      {DateTime completedAt,
      String languageCode,
      int totalSentences,
      int averageAccuracy,
      int totalPoints,
      List<ListeningPracticeSentenceModel> sentencePerformances,
      Duration totalTimeSpent});
}

/// @nodoc
class _$ListeningPracticePerformanceModelCopyWithImpl<$Res>
    implements $ListeningPracticePerformanceModelCopyWith<$Res> {
  _$ListeningPracticePerformanceModelCopyWithImpl(this._self, this._then);

  final ListeningPracticePerformanceModel _self;
  final $Res Function(ListeningPracticePerformanceModel) _then;

  /// Create a copy of ListeningPracticePerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedAt = null,
    Object? languageCode = null,
    Object? totalSentences = null,
    Object? averageAccuracy = null,
    Object? totalPoints = null,
    Object? sentencePerformances = null,
    Object? totalTimeSpent = null,
  }) {
    return _then(_self.copyWith(
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      totalSentences: null == totalSentences
          ? _self.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int,
      averageAccuracy: null == averageAccuracy
          ? _self.averageAccuracy
          : averageAccuracy // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      sentencePerformances: null == sentencePerformances
          ? _self.sentencePerformances
          : sentencePerformances // ignore: cast_nullable_to_non_nullable
              as List<ListeningPracticeSentenceModel>,
      totalTimeSpent: null == totalTimeSpent
          ? _self.totalTimeSpent
          : totalTimeSpent // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _ListeningPracticePerformanceModel
    implements ListeningPracticePerformanceModel {
  const _ListeningPracticePerformanceModel(
      {required this.completedAt,
      required this.languageCode,
      required this.totalSentences,
      required this.averageAccuracy,
      required this.totalPoints,
      required final List<ListeningPracticeSentenceModel> sentencePerformances,
      required this.totalTimeSpent})
      : _sentencePerformances = sentencePerformances;
  factory _ListeningPracticePerformanceModel.fromJson(
          Map<String, dynamic> json) =>
      _$ListeningPracticePerformanceModelFromJson(json);

  @override
  final DateTime completedAt;
  @override
  final String languageCode;
  @override
  final int totalSentences;
  @override
  final int averageAccuracy;
  @override
  final int totalPoints;
  final List<ListeningPracticeSentenceModel> _sentencePerformances;
  @override
  List<ListeningPracticeSentenceModel> get sentencePerformances {
    if (_sentencePerformances is EqualUnmodifiableListView)
      return _sentencePerformances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentencePerformances);
  }

  @override
  final Duration totalTimeSpent;

  /// Create a copy of ListeningPracticePerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListeningPracticePerformanceModelCopyWith<
          _ListeningPracticePerformanceModel>
      get copyWith => __$ListeningPracticePerformanceModelCopyWithImpl<
          _ListeningPracticePerformanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListeningPracticePerformanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListeningPracticePerformanceModel &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.totalSentences, totalSentences) ||
                other.totalSentences == totalSentences) &&
            (identical(other.averageAccuracy, averageAccuracy) ||
                other.averageAccuracy == averageAccuracy) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            const DeepCollectionEquality()
                .equals(other._sentencePerformances, _sentencePerformances) &&
            (identical(other.totalTimeSpent, totalTimeSpent) ||
                other.totalTimeSpent == totalTimeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      completedAt,
      languageCode,
      totalSentences,
      averageAccuracy,
      totalPoints,
      const DeepCollectionEquality().hash(_sentencePerformances),
      totalTimeSpent);

  @override
  String toString() {
    return 'ListeningPracticePerformanceModel(completedAt: $completedAt, languageCode: $languageCode, totalSentences: $totalSentences, averageAccuracy: $averageAccuracy, totalPoints: $totalPoints, sentencePerformances: $sentencePerformances, totalTimeSpent: $totalTimeSpent)';
  }
}

/// @nodoc
abstract mixin class _$ListeningPracticePerformanceModelCopyWith<$Res>
    implements $ListeningPracticePerformanceModelCopyWith<$Res> {
  factory _$ListeningPracticePerformanceModelCopyWith(
          _ListeningPracticePerformanceModel value,
          $Res Function(_ListeningPracticePerformanceModel) _then) =
      __$ListeningPracticePerformanceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime completedAt,
      String languageCode,
      int totalSentences,
      int averageAccuracy,
      int totalPoints,
      List<ListeningPracticeSentenceModel> sentencePerformances,
      Duration totalTimeSpent});
}

/// @nodoc
class __$ListeningPracticePerformanceModelCopyWithImpl<$Res>
    implements _$ListeningPracticePerformanceModelCopyWith<$Res> {
  __$ListeningPracticePerformanceModelCopyWithImpl(this._self, this._then);

  final _ListeningPracticePerformanceModel _self;
  final $Res Function(_ListeningPracticePerformanceModel) _then;

  /// Create a copy of ListeningPracticePerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? completedAt = null,
    Object? languageCode = null,
    Object? totalSentences = null,
    Object? averageAccuracy = null,
    Object? totalPoints = null,
    Object? sentencePerformances = null,
    Object? totalTimeSpent = null,
  }) {
    return _then(_ListeningPracticePerformanceModel(
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      totalSentences: null == totalSentences
          ? _self.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int,
      averageAccuracy: null == averageAccuracy
          ? _self.averageAccuracy
          : averageAccuracy // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      sentencePerformances: null == sentencePerformances
          ? _self._sentencePerformances
          : sentencePerformances // ignore: cast_nullable_to_non_nullable
              as List<ListeningPracticeSentenceModel>,
      totalTimeSpent: null == totalTimeSpent
          ? _self.totalTimeSpent
          : totalTimeSpent // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
mixin _$ListeningPracticeSentenceModel {
  String get id;
  String get english;
  String get arabic;

  /// Create a copy of ListeningPracticeSentenceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListeningPracticeSentenceModelCopyWith<ListeningPracticeSentenceModel>
      get copyWith => _$ListeningPracticeSentenceModelCopyWithImpl<
              ListeningPracticeSentenceModel>(
          this as ListeningPracticeSentenceModel, _$identity);

  /// Serializes this ListeningPracticeSentenceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListeningPracticeSentenceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.arabic, arabic) || other.arabic == arabic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, english, arabic);

  @override
  String toString() {
    return 'ListeningPracticeSentenceModel(id: $id, english: $english, arabic: $arabic)';
  }
}

/// @nodoc
abstract mixin class $ListeningPracticeSentenceModelCopyWith<$Res> {
  factory $ListeningPracticeSentenceModelCopyWith(
          ListeningPracticeSentenceModel value,
          $Res Function(ListeningPracticeSentenceModel) _then) =
      _$ListeningPracticeSentenceModelCopyWithImpl;
  @useResult
  $Res call({String id, String english, String arabic});
}

/// @nodoc
class _$ListeningPracticeSentenceModelCopyWithImpl<$Res>
    implements $ListeningPracticeSentenceModelCopyWith<$Res> {
  _$ListeningPracticeSentenceModelCopyWithImpl(this._self, this._then);

  final ListeningPracticeSentenceModel _self;
  final $Res Function(ListeningPracticeSentenceModel) _then;

  /// Create a copy of ListeningPracticeSentenceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? english = null,
    Object? arabic = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      arabic: null == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _ListeningPracticeSentenceModel
    implements ListeningPracticeSentenceModel {
  const _ListeningPracticeSentenceModel(
      {required this.id, required this.english, required this.arabic});
  factory _ListeningPracticeSentenceModel.fromJson(Map<String, dynamic> json) =>
      _$ListeningPracticeSentenceModelFromJson(json);

  @override
  final String id;
  @override
  final String english;
  @override
  final String arabic;

  /// Create a copy of ListeningPracticeSentenceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListeningPracticeSentenceModelCopyWith<_ListeningPracticeSentenceModel>
      get copyWith => __$ListeningPracticeSentenceModelCopyWithImpl<
          _ListeningPracticeSentenceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListeningPracticeSentenceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListeningPracticeSentenceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.arabic, arabic) || other.arabic == arabic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, english, arabic);

  @override
  String toString() {
    return 'ListeningPracticeSentenceModel(id: $id, english: $english, arabic: $arabic)';
  }
}

/// @nodoc
abstract mixin class _$ListeningPracticeSentenceModelCopyWith<$Res>
    implements $ListeningPracticeSentenceModelCopyWith<$Res> {
  factory _$ListeningPracticeSentenceModelCopyWith(
          _ListeningPracticeSentenceModel value,
          $Res Function(_ListeningPracticeSentenceModel) _then) =
      __$ListeningPracticeSentenceModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String english, String arabic});
}

/// @nodoc
class __$ListeningPracticeSentenceModelCopyWithImpl<$Res>
    implements _$ListeningPracticeSentenceModelCopyWith<$Res> {
  __$ListeningPracticeSentenceModelCopyWithImpl(this._self, this._then);

  final _ListeningPracticeSentenceModel _self;
  final $Res Function(_ListeningPracticeSentenceModel) _then;

  /// Create a copy of ListeningPracticeSentenceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? english = null,
    Object? arabic = null,
  }) {
    return _then(_ListeningPracticeSentenceModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      arabic: null == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$WordComparisonModel {
  String get targetWord;
  String get userWord;
  bool get isCorrect;
  int get position;
  WordComparisonType get type;

  /// Create a copy of WordComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WordComparisonModelCopyWith<WordComparisonModel> get copyWith =>
      _$WordComparisonModelCopyWithImpl<WordComparisonModel>(
          this as WordComparisonModel, _$identity);

  /// Serializes this WordComparisonModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WordComparisonModel &&
            (identical(other.targetWord, targetWord) ||
                other.targetWord == targetWord) &&
            (identical(other.userWord, userWord) ||
                other.userWord == userWord) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, targetWord, userWord, isCorrect, position, type);

  @override
  String toString() {
    return 'WordComparisonModel(targetWord: $targetWord, userWord: $userWord, isCorrect: $isCorrect, position: $position, type: $type)';
  }
}

/// @nodoc
abstract mixin class $WordComparisonModelCopyWith<$Res> {
  factory $WordComparisonModelCopyWith(
          WordComparisonModel value, $Res Function(WordComparisonModel) _then) =
      _$WordComparisonModelCopyWithImpl;
  @useResult
  $Res call(
      {String targetWord,
      String userWord,
      bool isCorrect,
      int position,
      WordComparisonType type});
}

/// @nodoc
class _$WordComparisonModelCopyWithImpl<$Res>
    implements $WordComparisonModelCopyWith<$Res> {
  _$WordComparisonModelCopyWithImpl(this._self, this._then);

  final WordComparisonModel _self;
  final $Res Function(WordComparisonModel) _then;

  /// Create a copy of WordComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetWord = null,
    Object? userWord = null,
    Object? isCorrect = null,
    Object? position = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      targetWord: null == targetWord
          ? _self.targetWord
          : targetWord // ignore: cast_nullable_to_non_nullable
              as String,
      userWord: null == userWord
          ? _self.userWord
          : userWord // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as WordComparisonType,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _WordComparisonModel implements WordComparisonModel {
  const _WordComparisonModel(
      {required this.targetWord,
      required this.userWord,
      required this.isCorrect,
      required this.position,
      required this.type});
  factory _WordComparisonModel.fromJson(Map<String, dynamic> json) =>
      _$WordComparisonModelFromJson(json);

  @override
  final String targetWord;
  @override
  final String userWord;
  @override
  final bool isCorrect;
  @override
  final int position;
  @override
  final WordComparisonType type;

  /// Create a copy of WordComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WordComparisonModelCopyWith<_WordComparisonModel> get copyWith =>
      __$WordComparisonModelCopyWithImpl<_WordComparisonModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WordComparisonModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordComparisonModel &&
            (identical(other.targetWord, targetWord) ||
                other.targetWord == targetWord) &&
            (identical(other.userWord, userWord) ||
                other.userWord == userWord) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, targetWord, userWord, isCorrect, position, type);

  @override
  String toString() {
    return 'WordComparisonModel(targetWord: $targetWord, userWord: $userWord, isCorrect: $isCorrect, position: $position, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$WordComparisonModelCopyWith<$Res>
    implements $WordComparisonModelCopyWith<$Res> {
  factory _$WordComparisonModelCopyWith(_WordComparisonModel value,
          $Res Function(_WordComparisonModel) _then) =
      __$WordComparisonModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String targetWord,
      String userWord,
      bool isCorrect,
      int position,
      WordComparisonType type});
}

/// @nodoc
class __$WordComparisonModelCopyWithImpl<$Res>
    implements _$WordComparisonModelCopyWith<$Res> {
  __$WordComparisonModelCopyWithImpl(this._self, this._then);

  final _WordComparisonModel _self;
  final $Res Function(_WordComparisonModel) _then;

  /// Create a copy of WordComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? targetWord = null,
    Object? userWord = null,
    Object? isCorrect = null,
    Object? position = null,
    Object? type = null,
  }) {
    return _then(_WordComparisonModel(
      targetWord: null == targetWord
          ? _self.targetWord
          : targetWord // ignore: cast_nullable_to_non_nullable
              as String,
      userWord: null == userWord
          ? _self.userWord
          : userWord // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as WordComparisonType,
    ));
  }
}

/// @nodoc
mixin _$SentenceResultModel {
  String get sentenceId;
  String get userInput;
  String get targetText;
  int get accuracy;
  List<WordComparisonModel> get wordComparisons;
  DateTime get completedAt;
  int get attempts;

  /// Create a copy of SentenceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SentenceResultModelCopyWith<SentenceResultModel> get copyWith =>
      _$SentenceResultModelCopyWithImpl<SentenceResultModel>(
          this as SentenceResultModel, _$identity);

  /// Serializes this SentenceResultModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SentenceResultModel &&
            (identical(other.sentenceId, sentenceId) ||
                other.sentenceId == sentenceId) &&
            (identical(other.userInput, userInput) ||
                other.userInput == userInput) &&
            (identical(other.targetText, targetText) ||
                other.targetText == targetText) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            const DeepCollectionEquality()
                .equals(other.wordComparisons, wordComparisons) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sentenceId,
      userInput,
      targetText,
      accuracy,
      const DeepCollectionEquality().hash(wordComparisons),
      completedAt,
      attempts);

  @override
  String toString() {
    return 'SentenceResultModel(sentenceId: $sentenceId, userInput: $userInput, targetText: $targetText, accuracy: $accuracy, wordComparisons: $wordComparisons, completedAt: $completedAt, attempts: $attempts)';
  }
}

/// @nodoc
abstract mixin class $SentenceResultModelCopyWith<$Res> {
  factory $SentenceResultModelCopyWith(
          SentenceResultModel value, $Res Function(SentenceResultModel) _then) =
      _$SentenceResultModelCopyWithImpl;
  @useResult
  $Res call(
      {String sentenceId,
      String userInput,
      String targetText,
      int accuracy,
      List<WordComparisonModel> wordComparisons,
      DateTime completedAt,
      int attempts});
}

/// @nodoc
class _$SentenceResultModelCopyWithImpl<$Res>
    implements $SentenceResultModelCopyWith<$Res> {
  _$SentenceResultModelCopyWithImpl(this._self, this._then);

  final SentenceResultModel _self;
  final $Res Function(SentenceResultModel) _then;

  /// Create a copy of SentenceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentenceId = null,
    Object? userInput = null,
    Object? targetText = null,
    Object? accuracy = null,
    Object? wordComparisons = null,
    Object? completedAt = null,
    Object? attempts = null,
  }) {
    return _then(_self.copyWith(
      sentenceId: null == sentenceId
          ? _self.sentenceId
          : sentenceId // ignore: cast_nullable_to_non_nullable
              as String,
      userInput: null == userInput
          ? _self.userInput
          : userInput // ignore: cast_nullable_to_non_nullable
              as String,
      targetText: null == targetText
          ? _self.targetText
          : targetText // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      wordComparisons: null == wordComparisons
          ? _self.wordComparisons
          : wordComparisons // ignore: cast_nullable_to_non_nullable
              as List<WordComparisonModel>,
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attempts: null == attempts
          ? _self.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _SentenceResultModel implements SentenceResultModel {
  const _SentenceResultModel(
      {required this.sentenceId,
      required this.userInput,
      required this.targetText,
      required this.accuracy,
      required final List<WordComparisonModel> wordComparisons,
      required this.completedAt,
      required this.attempts})
      : _wordComparisons = wordComparisons;
  factory _SentenceResultModel.fromJson(Map<String, dynamic> json) =>
      _$SentenceResultModelFromJson(json);

  @override
  final String sentenceId;
  @override
  final String userInput;
  @override
  final String targetText;
  @override
  final int accuracy;
  final List<WordComparisonModel> _wordComparisons;
  @override
  List<WordComparisonModel> get wordComparisons {
    if (_wordComparisons is EqualUnmodifiableListView) return _wordComparisons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordComparisons);
  }

  @override
  final DateTime completedAt;
  @override
  final int attempts;

  /// Create a copy of SentenceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SentenceResultModelCopyWith<_SentenceResultModel> get copyWith =>
      __$SentenceResultModelCopyWithImpl<_SentenceResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SentenceResultModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SentenceResultModel &&
            (identical(other.sentenceId, sentenceId) ||
                other.sentenceId == sentenceId) &&
            (identical(other.userInput, userInput) ||
                other.userInput == userInput) &&
            (identical(other.targetText, targetText) ||
                other.targetText == targetText) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            const DeepCollectionEquality()
                .equals(other._wordComparisons, _wordComparisons) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sentenceId,
      userInput,
      targetText,
      accuracy,
      const DeepCollectionEquality().hash(_wordComparisons),
      completedAt,
      attempts);

  @override
  String toString() {
    return 'SentenceResultModel(sentenceId: $sentenceId, userInput: $userInput, targetText: $targetText, accuracy: $accuracy, wordComparisons: $wordComparisons, completedAt: $completedAt, attempts: $attempts)';
  }
}

/// @nodoc
abstract mixin class _$SentenceResultModelCopyWith<$Res>
    implements $SentenceResultModelCopyWith<$Res> {
  factory _$SentenceResultModelCopyWith(_SentenceResultModel value,
          $Res Function(_SentenceResultModel) _then) =
      __$SentenceResultModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sentenceId,
      String userInput,
      String targetText,
      int accuracy,
      List<WordComparisonModel> wordComparisons,
      DateTime completedAt,
      int attempts});
}

/// @nodoc
class __$SentenceResultModelCopyWithImpl<$Res>
    implements _$SentenceResultModelCopyWith<$Res> {
  __$SentenceResultModelCopyWithImpl(this._self, this._then);

  final _SentenceResultModel _self;
  final $Res Function(_SentenceResultModel) _then;

  /// Create a copy of SentenceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sentenceId = null,
    Object? userInput = null,
    Object? targetText = null,
    Object? accuracy = null,
    Object? wordComparisons = null,
    Object? completedAt = null,
    Object? attempts = null,
  }) {
    return _then(_SentenceResultModel(
      sentenceId: null == sentenceId
          ? _self.sentenceId
          : sentenceId // ignore: cast_nullable_to_non_nullable
              as String,
      userInput: null == userInput
          ? _self.userInput
          : userInput // ignore: cast_nullable_to_non_nullable
              as String,
      targetText: null == targetText
          ? _self.targetText
          : targetText // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      wordComparisons: null == wordComparisons
          ? _self._wordComparisons
          : wordComparisons // ignore: cast_nullable_to_non_nullable
              as List<WordComparisonModel>,
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attempts: null == attempts
          ? _self.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
