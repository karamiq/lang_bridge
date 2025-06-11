// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategorynModel {
  String get id;
  String get english;
  String get arabic;
  String get arabicPronunciation;
  String get englishPronunciation;
  CategoryEnum get category;

  /// Create a copy of CategorynModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategorynModelCopyWith<CategorynModel> get copyWith =>
      _$CategorynModelCopyWithImpl<CategorynModel>(
          this as CategorynModel, _$identity);

  /// Serializes this CategorynModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategorynModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.arabicPronunciation, arabicPronunciation) ||
                other.arabicPronunciation == arabicPronunciation) &&
            (identical(other.englishPronunciation, englishPronunciation) ||
                other.englishPronunciation == englishPronunciation) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, english, arabic,
      arabicPronunciation, englishPronunciation, category);

  @override
  String toString() {
    return 'CategorynModel(id: $id, english: $english, arabic: $arabic, arabicPronunciation: $arabicPronunciation, englishPronunciation: $englishPronunciation, category: $category)';
  }
}

/// @nodoc
abstract mixin class $CategorynModelCopyWith<$Res> {
  factory $CategorynModelCopyWith(
          CategorynModel value, $Res Function(CategorynModel) _then) =
      _$CategorynModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String english,
      String arabic,
      String arabicPronunciation,
      String englishPronunciation,
      CategoryEnum category});
}

/// @nodoc
class _$CategorynModelCopyWithImpl<$Res>
    implements $CategorynModelCopyWith<$Res> {
  _$CategorynModelCopyWithImpl(this._self, this._then);

  final CategorynModel _self;
  final $Res Function(CategorynModel) _then;

  /// Create a copy of CategorynModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? english = null,
    Object? arabic = null,
    Object? arabicPronunciation = null,
    Object? englishPronunciation = null,
    Object? category = null,
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
      arabicPronunciation: null == arabicPronunciation
          ? _self.arabicPronunciation
          : arabicPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      englishPronunciation: null == englishPronunciation
          ? _self.englishPronunciation
          : englishPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _CategorynModel extends CategorynModel {
  const _CategorynModel(
      {required this.id,
      required this.english,
      required this.arabic,
      required this.arabicPronunciation,
      required this.englishPronunciation,
      required this.category})
      : super._();
  factory _CategorynModel.fromJson(Map<String, dynamic> json) =>
      _$CategorynModelFromJson(json);

  @override
  final String id;
  @override
  final String english;
  @override
  final String arabic;
  @override
  final String arabicPronunciation;
  @override
  final String englishPronunciation;
  @override
  final CategoryEnum category;

  /// Create a copy of CategorynModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategorynModelCopyWith<_CategorynModel> get copyWith =>
      __$CategorynModelCopyWithImpl<_CategorynModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategorynModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategorynModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.arabicPronunciation, arabicPronunciation) ||
                other.arabicPronunciation == arabicPronunciation) &&
            (identical(other.englishPronunciation, englishPronunciation) ||
                other.englishPronunciation == englishPronunciation) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, english, arabic,
      arabicPronunciation, englishPronunciation, category);

  @override
  String toString() {
    return 'CategorynModel(id: $id, english: $english, arabic: $arabic, arabicPronunciation: $arabicPronunciation, englishPronunciation: $englishPronunciation, category: $category)';
  }
}

/// @nodoc
abstract mixin class _$CategorynModelCopyWith<$Res>
    implements $CategorynModelCopyWith<$Res> {
  factory _$CategorynModelCopyWith(
          _CategorynModel value, $Res Function(_CategorynModel) _then) =
      __$CategorynModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String english,
      String arabic,
      String arabicPronunciation,
      String englishPronunciation,
      CategoryEnum category});
}

/// @nodoc
class __$CategorynModelCopyWithImpl<$Res>
    implements _$CategorynModelCopyWith<$Res> {
  __$CategorynModelCopyWithImpl(this._self, this._then);

  final _CategorynModel _self;
  final $Res Function(_CategorynModel) _then;

  /// Create a copy of CategorynModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? english = null,
    Object? arabic = null,
    Object? arabicPronunciation = null,
    Object? englishPronunciation = null,
    Object? category = null,
  }) {
    return _then(_CategorynModel(
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
      arabicPronunciation: null == arabicPronunciation
          ? _self.arabicPronunciation
          : arabicPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      englishPronunciation: null == englishPronunciation
          ? _self.englishPronunciation
          : englishPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
    ));
  }
}

// dart format on
