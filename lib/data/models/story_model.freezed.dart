// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryModel {
  String get id;
  String get titleEn;
  String get titleAr;
  String get contentEn;
  String get contentAr;
  String get descriptionEn; // ➕ English description
  String get descriptionAr; // ➕ Arabic description
  EnglishLevelEnum get level;
  int get duration;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoryModelCopyWith<StoryModel> get copyWith =>
      _$StoryModelCopyWithImpl<StoryModel>(this as StoryModel, _$identity);

  /// Serializes this StoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.contentEn, contentEn) ||
                other.contentEn == contentEn) &&
            (identical(other.contentAr, contentAr) ||
                other.contentAr == contentAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, titleEn, titleAr, contentEn,
      contentAr, descriptionEn, descriptionAr, level, duration);

  @override
  String toString() {
    return 'StoryModel(id: $id, titleEn: $titleEn, titleAr: $titleAr, contentEn: $contentEn, contentAr: $contentAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, level: $level, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) _then) =
      _$StoryModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String titleEn,
      String titleAr,
      String contentEn,
      String contentAr,
      String descriptionEn,
      String descriptionAr,
      EnglishLevelEnum level,
      int duration});
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res> implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._self, this._then);

  final StoryModel _self;
  final $Res Function(StoryModel) _then;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleEn = null,
    Object? titleAr = null,
    Object? contentEn = null,
    Object? contentAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? level = null,
    Object? duration = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _self.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _self.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
      contentEn: null == contentEn
          ? _self.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String,
      contentAr: null == contentAr
          ? _self.contentAr
          : contentAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _self.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _self.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as EnglishLevelEnum,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _StoryModel extends StoryModel {
  const _StoryModel(
      {required this.id,
      required this.titleEn,
      required this.titleAr,
      required this.contentEn,
      required this.contentAr,
      required this.descriptionEn,
      required this.descriptionAr,
      required this.level,
      required this.duration})
      : super._();
  factory _StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  @override
  final String id;
  @override
  final String titleEn;
  @override
  final String titleAr;
  @override
  final String contentEn;
  @override
  final String contentAr;
  @override
  final String descriptionEn;
// ➕ English description
  @override
  final String descriptionAr;
// ➕ Arabic description
  @override
  final EnglishLevelEnum level;
  @override
  final int duration;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StoryModelCopyWith<_StoryModel> get copyWith =>
      __$StoryModelCopyWithImpl<_StoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.contentEn, contentEn) ||
                other.contentEn == contentEn) &&
            (identical(other.contentAr, contentAr) ||
                other.contentAr == contentAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, titleEn, titleAr, contentEn,
      contentAr, descriptionEn, descriptionAr, level, duration);

  @override
  String toString() {
    return 'StoryModel(id: $id, titleEn: $titleEn, titleAr: $titleAr, contentEn: $contentEn, contentAr: $contentAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, level: $level, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$StoryModelCopyWith<$Res>
    implements $StoryModelCopyWith<$Res> {
  factory _$StoryModelCopyWith(
          _StoryModel value, $Res Function(_StoryModel) _then) =
      __$StoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String titleEn,
      String titleAr,
      String contentEn,
      String contentAr,
      String descriptionEn,
      String descriptionAr,
      EnglishLevelEnum level,
      int duration});
}

/// @nodoc
class __$StoryModelCopyWithImpl<$Res> implements _$StoryModelCopyWith<$Res> {
  __$StoryModelCopyWithImpl(this._self, this._then);

  final _StoryModel _self;
  final $Res Function(_StoryModel) _then;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? titleEn = null,
    Object? titleAr = null,
    Object? contentEn = null,
    Object? contentAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? level = null,
    Object? duration = null,
  }) {
    return _then(_StoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _self.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _self.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
      contentEn: null == contentEn
          ? _self.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String,
      contentAr: null == contentAr
          ? _self.contentAr
          : contentAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _self.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _self.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as EnglishLevelEnum,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
