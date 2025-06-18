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
      category:
          const CategoryEnumConverter().fromJson(json['category'] as String),
    );

Map<String, dynamic> _$CategorynModelToJson(_CategorynModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english': instance.english,
      'arabic': instance.arabic,
      'arabicPronunciation': instance.arabicPronunciation,
      'englishPronunciation': instance.englishPronunciation,
      'category': const CategoryEnumConverter().toJson(instance.category),
    };

const _$PhraseEnumEnumMap = {
  PhraseEnum.introduction: 'introduction',
  PhraseEnum.greetings: 'greetings',
  PhraseEnum.commonPhrases: 'common_phrases',
  PhraseEnum.questions: 'questions',
  PhraseEnum.directions: 'directions',
  PhraseEnum.shopping: 'shopping',
  PhraseEnum.foodAndDrink: 'food_and_drink',
  PhraseEnum.travel: 'travel',
  PhraseEnum.emergencies: 'emergencies',
};

const _$WordEnumEnumMap = {
  WordEnum.animals: 'animals',
  WordEnum.colors: 'colors',
  WordEnum.numbers: 'numbers',
  WordEnum.family: 'family',
  WordEnum.school: 'school',
  WordEnum.food: 'food',
};
