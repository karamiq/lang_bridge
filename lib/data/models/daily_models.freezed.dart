// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyWordModel {
  String get arabicWord;
  String get englishWord;
  String get pronunciation;
  String get exampleArabic;
  String get exampleEnglish;
  int get points;

  /// Create a copy of DailyWordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyWordModelCopyWith<DailyWordModel> get copyWith =>
      _$DailyWordModelCopyWithImpl<DailyWordModel>(
          this as DailyWordModel, _$identity);

  /// Serializes this DailyWordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyWordModel &&
            (identical(other.arabicWord, arabicWord) ||
                other.arabicWord == arabicWord) &&
            (identical(other.englishWord, englishWord) ||
                other.englishWord == englishWord) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.exampleArabic, exampleArabic) ||
                other.exampleArabic == exampleArabic) &&
            (identical(other.exampleEnglish, exampleEnglish) ||
                other.exampleEnglish == exampleEnglish) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, arabicWord, englishWord,
      pronunciation, exampleArabic, exampleEnglish, points);

  @override
  String toString() {
    return 'DailyWordModel(arabicWord: $arabicWord, englishWord: $englishWord, pronunciation: $pronunciation, exampleArabic: $exampleArabic, exampleEnglish: $exampleEnglish, points: $points)';
  }
}

/// @nodoc
abstract mixin class $DailyWordModelCopyWith<$Res> {
  factory $DailyWordModelCopyWith(
          DailyWordModel value, $Res Function(DailyWordModel) _then) =
      _$DailyWordModelCopyWithImpl;
  @useResult
  $Res call(
      {String arabicWord,
      String englishWord,
      String pronunciation,
      String exampleArabic,
      String exampleEnglish,
      int points});
}

/// @nodoc
class _$DailyWordModelCopyWithImpl<$Res>
    implements $DailyWordModelCopyWith<$Res> {
  _$DailyWordModelCopyWithImpl(this._self, this._then);

  final DailyWordModel _self;
  final $Res Function(DailyWordModel) _then;

  /// Create a copy of DailyWordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicWord = null,
    Object? englishWord = null,
    Object? pronunciation = null,
    Object? exampleArabic = null,
    Object? exampleEnglish = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      arabicWord: null == arabicWord
          ? _self.arabicWord
          : arabicWord // ignore: cast_nullable_to_non_nullable
              as String,
      englishWord: null == englishWord
          ? _self.englishWord
          : englishWord // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciation: null == pronunciation
          ? _self.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      exampleArabic: null == exampleArabic
          ? _self.exampleArabic
          : exampleArabic // ignore: cast_nullable_to_non_nullable
              as String,
      exampleEnglish: null == exampleEnglish
          ? _self.exampleEnglish
          : exampleEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DailyWordModel implements DailyWordModel {
  const _DailyWordModel(
      {required this.arabicWord,
      required this.englishWord,
      required this.pronunciation,
      required this.exampleArabic,
      required this.exampleEnglish,
      required this.points});
  factory _DailyWordModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWordModelFromJson(json);

  @override
  final String arabicWord;
  @override
  final String englishWord;
  @override
  final String pronunciation;
  @override
  final String exampleArabic;
  @override
  final String exampleEnglish;
  @override
  final int points;

  /// Create a copy of DailyWordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyWordModelCopyWith<_DailyWordModel> get copyWith =>
      __$DailyWordModelCopyWithImpl<_DailyWordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyWordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyWordModel &&
            (identical(other.arabicWord, arabicWord) ||
                other.arabicWord == arabicWord) &&
            (identical(other.englishWord, englishWord) ||
                other.englishWord == englishWord) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.exampleArabic, exampleArabic) ||
                other.exampleArabic == exampleArabic) &&
            (identical(other.exampleEnglish, exampleEnglish) ||
                other.exampleEnglish == exampleEnglish) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, arabicWord, englishWord,
      pronunciation, exampleArabic, exampleEnglish, points);

  @override
  String toString() {
    return 'DailyWordModel(arabicWord: $arabicWord, englishWord: $englishWord, pronunciation: $pronunciation, exampleArabic: $exampleArabic, exampleEnglish: $exampleEnglish, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$DailyWordModelCopyWith<$Res>
    implements $DailyWordModelCopyWith<$Res> {
  factory _$DailyWordModelCopyWith(
          _DailyWordModel value, $Res Function(_DailyWordModel) _then) =
      __$DailyWordModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String arabicWord,
      String englishWord,
      String pronunciation,
      String exampleArabic,
      String exampleEnglish,
      int points});
}

/// @nodoc
class __$DailyWordModelCopyWithImpl<$Res>
    implements _$DailyWordModelCopyWith<$Res> {
  __$DailyWordModelCopyWithImpl(this._self, this._then);

  final _DailyWordModel _self;
  final $Res Function(_DailyWordModel) _then;

  /// Create a copy of DailyWordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? arabicWord = null,
    Object? englishWord = null,
    Object? pronunciation = null,
    Object? exampleArabic = null,
    Object? exampleEnglish = null,
    Object? points = null,
  }) {
    return _then(_DailyWordModel(
      arabicWord: null == arabicWord
          ? _self.arabicWord
          : arabicWord // ignore: cast_nullable_to_non_nullable
              as String,
      englishWord: null == englishWord
          ? _self.englishWord
          : englishWord // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciation: null == pronunciation
          ? _self.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      exampleArabic: null == exampleArabic
          ? _self.exampleArabic
          : exampleArabic // ignore: cast_nullable_to_non_nullable
              as String,
      exampleEnglish: null == exampleEnglish
          ? _self.exampleEnglish
          : exampleEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DailyPhraseModel {
  String get arabicPhrase;
  String get englishPhrase;
  String get pronunciation;
  String get responseArabic;
  String get responseEnglish;
  int get points;

  /// Create a copy of DailyPhraseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyPhraseModelCopyWith<DailyPhraseModel> get copyWith =>
      _$DailyPhraseModelCopyWithImpl<DailyPhraseModel>(
          this as DailyPhraseModel, _$identity);

  /// Serializes this DailyPhraseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyPhraseModel &&
            (identical(other.arabicPhrase, arabicPhrase) ||
                other.arabicPhrase == arabicPhrase) &&
            (identical(other.englishPhrase, englishPhrase) ||
                other.englishPhrase == englishPhrase) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.responseArabic, responseArabic) ||
                other.responseArabic == responseArabic) &&
            (identical(other.responseEnglish, responseEnglish) ||
                other.responseEnglish == responseEnglish) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, arabicPhrase, englishPhrase,
      pronunciation, responseArabic, responseEnglish, points);

  @override
  String toString() {
    return 'DailyPhraseModel(arabicPhrase: $arabicPhrase, englishPhrase: $englishPhrase, pronunciation: $pronunciation, responseArabic: $responseArabic, responseEnglish: $responseEnglish, points: $points)';
  }
}

/// @nodoc
abstract mixin class $DailyPhraseModelCopyWith<$Res> {
  factory $DailyPhraseModelCopyWith(
          DailyPhraseModel value, $Res Function(DailyPhraseModel) _then) =
      _$DailyPhraseModelCopyWithImpl;
  @useResult
  $Res call(
      {String arabicPhrase,
      String englishPhrase,
      String pronunciation,
      String responseArabic,
      String responseEnglish,
      int points});
}

/// @nodoc
class _$DailyPhraseModelCopyWithImpl<$Res>
    implements $DailyPhraseModelCopyWith<$Res> {
  _$DailyPhraseModelCopyWithImpl(this._self, this._then);

  final DailyPhraseModel _self;
  final $Res Function(DailyPhraseModel) _then;

  /// Create a copy of DailyPhraseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicPhrase = null,
    Object? englishPhrase = null,
    Object? pronunciation = null,
    Object? responseArabic = null,
    Object? responseEnglish = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      arabicPhrase: null == arabicPhrase
          ? _self.arabicPhrase
          : arabicPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      englishPhrase: null == englishPhrase
          ? _self.englishPhrase
          : englishPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciation: null == pronunciation
          ? _self.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      responseArabic: null == responseArabic
          ? _self.responseArabic
          : responseArabic // ignore: cast_nullable_to_non_nullable
              as String,
      responseEnglish: null == responseEnglish
          ? _self.responseEnglish
          : responseEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DailyPhraseModel implements DailyPhraseModel {
  const _DailyPhraseModel(
      {required this.arabicPhrase,
      required this.englishPhrase,
      required this.pronunciation,
      required this.responseArabic,
      required this.responseEnglish,
      required this.points});
  factory _DailyPhraseModel.fromJson(Map<String, dynamic> json) =>
      _$DailyPhraseModelFromJson(json);

  @override
  final String arabicPhrase;
  @override
  final String englishPhrase;
  @override
  final String pronunciation;
  @override
  final String responseArabic;
  @override
  final String responseEnglish;
  @override
  final int points;

  /// Create a copy of DailyPhraseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyPhraseModelCopyWith<_DailyPhraseModel> get copyWith =>
      __$DailyPhraseModelCopyWithImpl<_DailyPhraseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyPhraseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyPhraseModel &&
            (identical(other.arabicPhrase, arabicPhrase) ||
                other.arabicPhrase == arabicPhrase) &&
            (identical(other.englishPhrase, englishPhrase) ||
                other.englishPhrase == englishPhrase) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.responseArabic, responseArabic) ||
                other.responseArabic == responseArabic) &&
            (identical(other.responseEnglish, responseEnglish) ||
                other.responseEnglish == responseEnglish) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, arabicPhrase, englishPhrase,
      pronunciation, responseArabic, responseEnglish, points);

  @override
  String toString() {
    return 'DailyPhraseModel(arabicPhrase: $arabicPhrase, englishPhrase: $englishPhrase, pronunciation: $pronunciation, responseArabic: $responseArabic, responseEnglish: $responseEnglish, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$DailyPhraseModelCopyWith<$Res>
    implements $DailyPhraseModelCopyWith<$Res> {
  factory _$DailyPhraseModelCopyWith(
          _DailyPhraseModel value, $Res Function(_DailyPhraseModel) _then) =
      __$DailyPhraseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String arabicPhrase,
      String englishPhrase,
      String pronunciation,
      String responseArabic,
      String responseEnglish,
      int points});
}

/// @nodoc
class __$DailyPhraseModelCopyWithImpl<$Res>
    implements _$DailyPhraseModelCopyWith<$Res> {
  __$DailyPhraseModelCopyWithImpl(this._self, this._then);

  final _DailyPhraseModel _self;
  final $Res Function(_DailyPhraseModel) _then;

  /// Create a copy of DailyPhraseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? arabicPhrase = null,
    Object? englishPhrase = null,
    Object? pronunciation = null,
    Object? responseArabic = null,
    Object? responseEnglish = null,
    Object? points = null,
  }) {
    return _then(_DailyPhraseModel(
      arabicPhrase: null == arabicPhrase
          ? _self.arabicPhrase
          : arabicPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      englishPhrase: null == englishPhrase
          ? _self.englishPhrase
          : englishPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciation: null == pronunciation
          ? _self.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      responseArabic: null == responseArabic
          ? _self.responseArabic
          : responseArabic // ignore: cast_nullable_to_non_nullable
              as String,
      responseEnglish: null == responseEnglish
          ? _self.responseEnglish
          : responseEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$QuizQuestionModel {
  String get question;
  List<String> get options;
  int get correctIndex;
  int get points;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizQuestionModelCopyWith<QuizQuestionModel> get copyWith =>
      _$QuizQuestionModelCopyWithImpl<QuizQuestionModel>(
          this as QuizQuestionModel, _$identity);

  /// Serializes this QuizQuestionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizQuestionModel &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.correctIndex, correctIndex) ||
                other.correctIndex == correctIndex) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question,
      const DeepCollectionEquality().hash(options), correctIndex, points);

  @override
  String toString() {
    return 'QuizQuestionModel(question: $question, options: $options, correctIndex: $correctIndex, points: $points)';
  }
}

/// @nodoc
abstract mixin class $QuizQuestionModelCopyWith<$Res> {
  factory $QuizQuestionModelCopyWith(
          QuizQuestionModel value, $Res Function(QuizQuestionModel) _then) =
      _$QuizQuestionModelCopyWithImpl;
  @useResult
  $Res call(
      {String question, List<String> options, int correctIndex, int points});
}

/// @nodoc
class _$QuizQuestionModelCopyWithImpl<$Res>
    implements $QuizQuestionModelCopyWith<$Res> {
  _$QuizQuestionModelCopyWithImpl(this._self, this._then);

  final QuizQuestionModel _self;
  final $Res Function(QuizQuestionModel) _then;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? options = null,
    Object? correctIndex = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctIndex: null == correctIndex
          ? _self.correctIndex
          : correctIndex // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizQuestionModel implements QuizQuestionModel {
  const _QuizQuestionModel(
      {required this.question,
      required final List<String> options,
      required this.correctIndex,
      required this.points})
      : _options = options;
  factory _QuizQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionModelFromJson(json);

  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int correctIndex;
  @override
  final int points;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizQuestionModelCopyWith<_QuizQuestionModel> get copyWith =>
      __$QuizQuestionModelCopyWithImpl<_QuizQuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizQuestionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizQuestionModel &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctIndex, correctIndex) ||
                other.correctIndex == correctIndex) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question,
      const DeepCollectionEquality().hash(_options), correctIndex, points);

  @override
  String toString() {
    return 'QuizQuestionModel(question: $question, options: $options, correctIndex: $correctIndex, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$QuizQuestionModelCopyWith<$Res>
    implements $QuizQuestionModelCopyWith<$Res> {
  factory _$QuizQuestionModelCopyWith(
          _QuizQuestionModel value, $Res Function(_QuizQuestionModel) _then) =
      __$QuizQuestionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String question, List<String> options, int correctIndex, int points});
}

/// @nodoc
class __$QuizQuestionModelCopyWithImpl<$Res>
    implements _$QuizQuestionModelCopyWith<$Res> {
  __$QuizQuestionModelCopyWithImpl(this._self, this._then);

  final _QuizQuestionModel _self;
  final $Res Function(_QuizQuestionModel) _then;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
    Object? options = null,
    Object? correctIndex = null,
    Object? points = null,
  }) {
    return _then(_QuizQuestionModel(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctIndex: null == correctIndex
          ? _self.correctIndex
          : correctIndex // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$VocabularyEntryModel {
  String get arabic;
  String get english;
  String get category;
  String get pronunciation;
  int get points;

  /// Create a copy of VocabularyEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VocabularyEntryModelCopyWith<VocabularyEntryModel> get copyWith =>
      _$VocabularyEntryModelCopyWithImpl<VocabularyEntryModel>(
          this as VocabularyEntryModel, _$identity);

  /// Serializes this VocabularyEntryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VocabularyEntryModel &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, arabic, english, category, pronunciation, points);

  @override
  String toString() {
    return 'VocabularyEntryModel(arabic: $arabic, english: $english, category: $category, pronunciation: $pronunciation, points: $points)';
  }
}

/// @nodoc
abstract mixin class $VocabularyEntryModelCopyWith<$Res> {
  factory $VocabularyEntryModelCopyWith(VocabularyEntryModel value,
          $Res Function(VocabularyEntryModel) _then) =
      _$VocabularyEntryModelCopyWithImpl;
  @useResult
  $Res call(
      {String arabic,
      String english,
      String category,
      String pronunciation,
      int points});
}

/// @nodoc
class _$VocabularyEntryModelCopyWithImpl<$Res>
    implements $VocabularyEntryModelCopyWith<$Res> {
  _$VocabularyEntryModelCopyWithImpl(this._self, this._then);

  final VocabularyEntryModel _self;
  final $Res Function(VocabularyEntryModel) _then;

  /// Create a copy of VocabularyEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabic = null,
    Object? english = null,
    Object? category = null,
    Object? pronunciation = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      arabic: null == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciation: null == pronunciation
          ? _self.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VocabularyEntryModel implements VocabularyEntryModel {
  const _VocabularyEntryModel(
      {required this.arabic,
      required this.english,
      required this.category,
      required this.pronunciation,
      required this.points});
  factory _VocabularyEntryModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyEntryModelFromJson(json);

  @override
  final String arabic;
  @override
  final String english;
  @override
  final String category;
  @override
  final String pronunciation;
  @override
  final int points;

  /// Create a copy of VocabularyEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VocabularyEntryModelCopyWith<_VocabularyEntryModel> get copyWith =>
      __$VocabularyEntryModelCopyWithImpl<_VocabularyEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VocabularyEntryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VocabularyEntryModel &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, arabic, english, category, pronunciation, points);

  @override
  String toString() {
    return 'VocabularyEntryModel(arabic: $arabic, english: $english, category: $category, pronunciation: $pronunciation, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$VocabularyEntryModelCopyWith<$Res>
    implements $VocabularyEntryModelCopyWith<$Res> {
  factory _$VocabularyEntryModelCopyWith(_VocabularyEntryModel value,
          $Res Function(_VocabularyEntryModel) _then) =
      __$VocabularyEntryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String arabic,
      String english,
      String category,
      String pronunciation,
      int points});
}

/// @nodoc
class __$VocabularyEntryModelCopyWithImpl<$Res>
    implements _$VocabularyEntryModelCopyWith<$Res> {
  __$VocabularyEntryModelCopyWithImpl(this._self, this._then);

  final _VocabularyEntryModel _self;
  final $Res Function(_VocabularyEntryModel) _then;

  /// Create a copy of VocabularyEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? arabic = null,
    Object? english = null,
    Object? category = null,
    Object? pronunciation = null,
    Object? points = null,
  }) {
    return _then(_VocabularyEntryModel(
      arabic: null == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciation: null == pronunciation
          ? _self.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
