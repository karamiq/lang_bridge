// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => _StoryModel(
      id: json['id'] as String,
      titleEn: json['titleEn'] as String,
      titleAr: json['titleAr'] as String,
      contentEn: json['contentEn'] as String,
      contentAr: json['contentAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      level: EnglishLevelEnum.fromJson(json['level'] as String),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$StoryModelToJson(_StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleEn': instance.titleEn,
      'titleAr': instance.titleAr,
      'contentEn': instance.contentEn,
      'contentAr': instance.contentAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'level': instance.level.toJson(),
      'duration': instance.duration,
    };

const _$EnglishLevelEnumEnumMap = {
  EnglishLevelEnum.beginner: 'beginner',
  EnglishLevelEnum.intermediate: 'intermediate',
  EnglishLevelEnum.advanced: 'advanced',
};
