// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyProgressModel {
  int get totalPoints;
  List<QuizQuestionModel> get currentQuizQuestion;
  DailyWordModel get currentWord;
  DailyPhraseModel get currentPhrase;
  List<VocabularyEntryModel> get vocabularyEntries;
  bool get isComplete;

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyProgressModelCopyWith<DailyProgressModel> get copyWith =>
      _$DailyProgressModelCopyWithImpl<DailyProgressModel>(
          this as DailyProgressModel, _$identity);

  /// Serializes this DailyProgressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyProgressModel &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            const DeepCollectionEquality()
                .equals(other.currentQuizQuestion, currentQuizQuestion) &&
            (identical(other.currentWord, currentWord) ||
                other.currentWord == currentWord) &&
            (identical(other.currentPhrase, currentPhrase) ||
                other.currentPhrase == currentPhrase) &&
            const DeepCollectionEquality()
                .equals(other.vocabularyEntries, vocabularyEntries) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPoints,
      const DeepCollectionEquality().hash(currentQuizQuestion),
      currentWord,
      currentPhrase,
      const DeepCollectionEquality().hash(vocabularyEntries),
      isComplete);

  @override
  String toString() {
    return 'DailyProgressModel(totalPoints: $totalPoints, currentQuizQuestion: $currentQuizQuestion, currentWord: $currentWord, currentPhrase: $currentPhrase, vocabularyEntries: $vocabularyEntries, isComplete: $isComplete)';
  }
}

/// @nodoc
abstract mixin class $DailyProgressModelCopyWith<$Res> {
  factory $DailyProgressModelCopyWith(
          DailyProgressModel value, $Res Function(DailyProgressModel) _then) =
      _$DailyProgressModelCopyWithImpl;
  @useResult
  $Res call(
      {int totalPoints,
      List<QuizQuestionModel> currentQuizQuestion,
      DailyWordModel currentWord,
      DailyPhraseModel currentPhrase,
      List<VocabularyEntryModel> vocabularyEntries,
      bool isComplete});

  $DailyWordModelCopyWith<$Res> get currentWord;
  $DailyPhraseModelCopyWith<$Res> get currentPhrase;
}

/// @nodoc
class _$DailyProgressModelCopyWithImpl<$Res>
    implements $DailyProgressModelCopyWith<$Res> {
  _$DailyProgressModelCopyWithImpl(this._self, this._then);

  final DailyProgressModel _self;
  final $Res Function(DailyProgressModel) _then;

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? currentQuizQuestion = null,
    Object? currentWord = null,
    Object? currentPhrase = null,
    Object? vocabularyEntries = null,
    Object? isComplete = null,
  }) {
    return _then(_self.copyWith(
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuizQuestion: null == currentQuizQuestion
          ? _self.currentQuizQuestion
          : currentQuizQuestion // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestionModel>,
      currentWord: null == currentWord
          ? _self.currentWord
          : currentWord // ignore: cast_nullable_to_non_nullable
              as DailyWordModel,
      currentPhrase: null == currentPhrase
          ? _self.currentPhrase
          : currentPhrase // ignore: cast_nullable_to_non_nullable
              as DailyPhraseModel,
      vocabularyEntries: null == vocabularyEntries
          ? _self.vocabularyEntries
          : vocabularyEntries // ignore: cast_nullable_to_non_nullable
              as List<VocabularyEntryModel>,
      isComplete: null == isComplete
          ? _self.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyWordModelCopyWith<$Res> get currentWord {
    return $DailyWordModelCopyWith<$Res>(_self.currentWord, (value) {
      return _then(_self.copyWith(currentWord: value));
    });
  }

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyPhraseModelCopyWith<$Res> get currentPhrase {
    return $DailyPhraseModelCopyWith<$Res>(_self.currentPhrase, (value) {
      return _then(_self.copyWith(currentPhrase: value));
    });
  }
}

/// @nodoc

@jsonSerializable
class _DailyProgressModel implements DailyProgressModel {
  const _DailyProgressModel(
      {required this.totalPoints,
      required final List<QuizQuestionModel> currentQuizQuestion,
      required this.currentWord,
      required this.currentPhrase,
      required final List<VocabularyEntryModel> vocabularyEntries,
      required this.isComplete})
      : _currentQuizQuestion = currentQuizQuestion,
        _vocabularyEntries = vocabularyEntries;
  factory _DailyProgressModel.fromJson(Map<String, dynamic> json) =>
      _$DailyProgressModelFromJson(json);

  @override
  final int totalPoints;
  final List<QuizQuestionModel> _currentQuizQuestion;
  @override
  List<QuizQuestionModel> get currentQuizQuestion {
    if (_currentQuizQuestion is EqualUnmodifiableListView)
      return _currentQuizQuestion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentQuizQuestion);
  }

  @override
  final DailyWordModel currentWord;
  @override
  final DailyPhraseModel currentPhrase;
  final List<VocabularyEntryModel> _vocabularyEntries;
  @override
  List<VocabularyEntryModel> get vocabularyEntries {
    if (_vocabularyEntries is EqualUnmodifiableListView)
      return _vocabularyEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vocabularyEntries);
  }

  @override
  final bool isComplete;

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyProgressModelCopyWith<_DailyProgressModel> get copyWith =>
      __$DailyProgressModelCopyWithImpl<_DailyProgressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyProgressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyProgressModel &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            const DeepCollectionEquality()
                .equals(other._currentQuizQuestion, _currentQuizQuestion) &&
            (identical(other.currentWord, currentWord) ||
                other.currentWord == currentWord) &&
            (identical(other.currentPhrase, currentPhrase) ||
                other.currentPhrase == currentPhrase) &&
            const DeepCollectionEquality()
                .equals(other._vocabularyEntries, _vocabularyEntries) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPoints,
      const DeepCollectionEquality().hash(_currentQuizQuestion),
      currentWord,
      currentPhrase,
      const DeepCollectionEquality().hash(_vocabularyEntries),
      isComplete);

  @override
  String toString() {
    return 'DailyProgressModel(totalPoints: $totalPoints, currentQuizQuestion: $currentQuizQuestion, currentWord: $currentWord, currentPhrase: $currentPhrase, vocabularyEntries: $vocabularyEntries, isComplete: $isComplete)';
  }
}

/// @nodoc
abstract mixin class _$DailyProgressModelCopyWith<$Res>
    implements $DailyProgressModelCopyWith<$Res> {
  factory _$DailyProgressModelCopyWith(
          _DailyProgressModel value, $Res Function(_DailyProgressModel) _then) =
      __$DailyProgressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalPoints,
      List<QuizQuestionModel> currentQuizQuestion,
      DailyWordModel currentWord,
      DailyPhraseModel currentPhrase,
      List<VocabularyEntryModel> vocabularyEntries,
      bool isComplete});

  @override
  $DailyWordModelCopyWith<$Res> get currentWord;
  @override
  $DailyPhraseModelCopyWith<$Res> get currentPhrase;
}

/// @nodoc
class __$DailyProgressModelCopyWithImpl<$Res>
    implements _$DailyProgressModelCopyWith<$Res> {
  __$DailyProgressModelCopyWithImpl(this._self, this._then);

  final _DailyProgressModel _self;
  final $Res Function(_DailyProgressModel) _then;

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalPoints = null,
    Object? currentQuizQuestion = null,
    Object? currentWord = null,
    Object? currentPhrase = null,
    Object? vocabularyEntries = null,
    Object? isComplete = null,
  }) {
    return _then(_DailyProgressModel(
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuizQuestion: null == currentQuizQuestion
          ? _self._currentQuizQuestion
          : currentQuizQuestion // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestionModel>,
      currentWord: null == currentWord
          ? _self.currentWord
          : currentWord // ignore: cast_nullable_to_non_nullable
              as DailyWordModel,
      currentPhrase: null == currentPhrase
          ? _self.currentPhrase
          : currentPhrase // ignore: cast_nullable_to_non_nullable
              as DailyPhraseModel,
      vocabularyEntries: null == vocabularyEntries
          ? _self._vocabularyEntries
          : vocabularyEntries // ignore: cast_nullable_to_non_nullable
              as List<VocabularyEntryModel>,
      isComplete: null == isComplete
          ? _self.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyWordModelCopyWith<$Res> get currentWord {
    return $DailyWordModelCopyWith<$Res>(_self.currentWord, (value) {
      return _then(_self.copyWith(currentWord: value));
    });
  }

  /// Create a copy of DailyProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyPhraseModelCopyWith<$Res> get currentPhrase {
    return $DailyPhraseModelCopyWith<$Res>(_self.currentPhrase, (value) {
      return _then(_self.copyWith(currentPhrase: value));
    });
  }
}

// dart format on
