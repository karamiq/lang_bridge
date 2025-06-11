// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategorynModel _$CategorynModelFromJson(Map<String, dynamic> json) =>
    _CategorynModel(
      id: json['id'] as String,
      english: json['english'] as String,
      arabic: json['arabic'] as String,
      arabicPronunciation: json['arabicPronunciation'] as String,
      englishPronunciation: json['englishPronunciation'] as String,
      category: CategoryEnum.fromJson(json['category'] as String),
    );

Map<String, dynamic> _$CategorynModelToJson(_CategorynModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english': instance.english,
      'arabic': instance.arabic,
      'arabicPronunciation': instance.arabicPronunciation,
      'englishPronunciation': instance.englishPronunciation,
      'category': instance.category.toJson(),
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.animals: 'animals',
  CategoryEnum.colors: 'colors',
  CategoryEnum.numbers: 'numbers',
  CategoryEnum.family: 'family',
  CategoryEnum.school: 'school',
  CategoryEnum.food: 'food',
};
