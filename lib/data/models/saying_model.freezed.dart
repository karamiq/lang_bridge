// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saying_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SayingModel {
  String get arabicSaying;
  String get englishSaying;
  String get arabicAuthor;
  String get englishAuthor;

  /// Create a copy of SayingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SayingModelCopyWith<SayingModel> get copyWith =>
      _$SayingModelCopyWithImpl<SayingModel>(this as SayingModel, _$identity);

  /// Serializes this SayingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SayingModel &&
            (identical(other.arabicSaying, arabicSaying) ||
                other.arabicSaying == arabicSaying) &&
            (identical(other.englishSaying, englishSaying) ||
                other.englishSaying == englishSaying) &&
            (identical(other.arabicAuthor, arabicAuthor) ||
                other.arabicAuthor == arabicAuthor) &&
            (identical(other.englishAuthor, englishAuthor) ||
                other.englishAuthor == englishAuthor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, arabicSaying, englishSaying, arabicAuthor, englishAuthor);

  @override
  String toString() {
    return 'SayingModel(arabicSaying: $arabicSaying, englishSaying: $englishSaying, arabicAuthor: $arabicAuthor, englishAuthor: $englishAuthor)';
  }
}

/// @nodoc
abstract mixin class $SayingModelCopyWith<$Res> {
  factory $SayingModelCopyWith(
          SayingModel value, $Res Function(SayingModel) _then) =
      _$SayingModelCopyWithImpl;
  @useResult
  $Res call(
      {String arabicSaying,
      String englishSaying,
      String arabicAuthor,
      String englishAuthor});
}

/// @nodoc
class _$SayingModelCopyWithImpl<$Res> implements $SayingModelCopyWith<$Res> {
  _$SayingModelCopyWithImpl(this._self, this._then);

  final SayingModel _self;
  final $Res Function(SayingModel) _then;

  /// Create a copy of SayingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicSaying = null,
    Object? englishSaying = null,
    Object? arabicAuthor = null,
    Object? englishAuthor = null,
  }) {
    return _then(_self.copyWith(
      arabicSaying: null == arabicSaying
          ? _self.arabicSaying
          : arabicSaying // ignore: cast_nullable_to_non_nullable
              as String,
      englishSaying: null == englishSaying
          ? _self.englishSaying
          : englishSaying // ignore: cast_nullable_to_non_nullable
              as String,
      arabicAuthor: null == arabicAuthor
          ? _self.arabicAuthor
          : arabicAuthor // ignore: cast_nullable_to_non_nullable
              as String,
      englishAuthor: null == englishAuthor
          ? _self.englishAuthor
          : englishAuthor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SayingModel implements SayingModel {
  const _SayingModel(
      {required this.arabicSaying,
      required this.englishSaying,
      required this.arabicAuthor,
      required this.englishAuthor});
  factory _SayingModel.fromJson(Map<String, dynamic> json) =>
      _$SayingModelFromJson(json);

  @override
  final String arabicSaying;
  @override
  final String englishSaying;
  @override
  final String arabicAuthor;
  @override
  final String englishAuthor;

  /// Create a copy of SayingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SayingModelCopyWith<_SayingModel> get copyWith =>
      __$SayingModelCopyWithImpl<_SayingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SayingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SayingModel &&
            (identical(other.arabicSaying, arabicSaying) ||
                other.arabicSaying == arabicSaying) &&
            (identical(other.englishSaying, englishSaying) ||
                other.englishSaying == englishSaying) &&
            (identical(other.arabicAuthor, arabicAuthor) ||
                other.arabicAuthor == arabicAuthor) &&
            (identical(other.englishAuthor, englishAuthor) ||
                other.englishAuthor == englishAuthor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, arabicSaying, englishSaying, arabicAuthor, englishAuthor);

  @override
  String toString() {
    return 'SayingModel(arabicSaying: $arabicSaying, englishSaying: $englishSaying, arabicAuthor: $arabicAuthor, englishAuthor: $englishAuthor)';
  }
}

/// @nodoc
abstract mixin class _$SayingModelCopyWith<$Res>
    implements $SayingModelCopyWith<$Res> {
  factory _$SayingModelCopyWith(
          _SayingModel value, $Res Function(_SayingModel) _then) =
      __$SayingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String arabicSaying,
      String englishSaying,
      String arabicAuthor,
      String englishAuthor});
}

/// @nodoc
class __$SayingModelCopyWithImpl<$Res> implements _$SayingModelCopyWith<$Res> {
  __$SayingModelCopyWithImpl(this._self, this._then);

  final _SayingModel _self;
  final $Res Function(_SayingModel) _then;

  /// Create a copy of SayingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? arabicSaying = null,
    Object? englishSaying = null,
    Object? arabicAuthor = null,
    Object? englishAuthor = null,
  }) {
    return _then(_SayingModel(
      arabicSaying: null == arabicSaying
          ? _self.arabicSaying
          : arabicSaying // ignore: cast_nullable_to_non_nullable
              as String,
      englishSaying: null == englishSaying
          ? _self.englishSaying
          : englishSaying // ignore: cast_nullable_to_non_nullable
              as String,
      arabicAuthor: null == arabicAuthor
          ? _self.arabicAuthor
          : arabicAuthor // ignore: cast_nullable_to_non_nullable
              as String,
      englishAuthor: null == englishAuthor
          ? _self.englishAuthor
          : englishAuthor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
