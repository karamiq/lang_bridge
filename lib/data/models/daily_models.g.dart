// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyWordModel _$DailyWordModelFromJson(Map<String, dynamic> json) =>
    _DailyWordModel(
      arabicWord: json['arabicWord'] as String,
      englishWord: json['englishWord'] as String,
      pronunciation: json['pronunciation'] as String,
      exampleArabic: json['exampleArabic'] as String,
      exampleEnglish: json['exampleEnglish'] as String,
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$DailyWordModelToJson(_DailyWordModel instance) =>
    <String, dynamic>{
      'arabicWord': instance.arabicWord,
      'englishWord': instance.englishWord,
      'pronunciation': instance.pronunciation,
      'exampleArabic': instance.exampleArabic,
      'exampleEnglish': instance.exampleEnglish,
      'points': instance.points,
    };

_DailyPhraseModel _$DailyPhraseModelFromJson(Map<String, dynamic> json) =>
    _DailyPhraseModel(
      arabicPhrase: json['arabicPhrase'] as String,
      englishPhrase: json['englishPhrase'] as String,
      pronunciation: json['pronunciation'] as String,
      responseArabic: json['responseArabic'] as String,
      responseEnglish: json['responseEnglish'] as String,
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$DailyPhraseModelToJson(_DailyPhraseModel instance) =>
    <String, dynamic>{
      'arabicPhrase': instance.arabicPhrase,
      'englishPhrase': instance.englishPhrase,
      'pronunciation': instance.pronunciation,
      'responseArabic': instance.responseArabic,
      'responseEnglish': instance.responseEnglish,
      'points': instance.points,
    };

_QuizQuestionModel _$QuizQuestionModelFromJson(Map<String, dynamic> json) =>
    _QuizQuestionModel(
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctIndex: (json['correctIndex'] as num).toInt(),
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$QuizQuestionModelToJson(_QuizQuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'correctIndex': instance.correctIndex,
      'points': instance.points,
    };

_VocabularyEntryModel _$VocabularyEntryModelFromJson(
        Map<String, dynamic> json) =>
    _VocabularyEntryModel(
      arabic: json['arabic'] as String,
      english: json['english'] as String,
      category: json['category'] as String,
      pronunciation: json['pronunciation'] as String,
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$VocabularyEntryModelToJson(
        _VocabularyEntryModel instance) =>
    <String, dynamic>{
      'arabic': instance.arabic,
      'english': instance.english,
      'category': instance.category,
      'pronunciation': instance.pronunciation,
      'points': instance.points,
    };
