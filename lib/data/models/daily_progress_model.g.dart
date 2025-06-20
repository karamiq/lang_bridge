// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyProgressModel _$DailyProgressModelFromJson(Map<String, dynamic> json) =>
    _DailyProgressModel(
      totalPoints: (json['totalPoints'] as num).toInt(),
      currentQuizQuestion: (json['currentQuizQuestion'] as List<dynamic>)
          .map((e) => QuizQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentWord:
          DailyWordModel.fromJson(json['currentWord'] as Map<String, dynamic>),
      currentPhrase: DailyPhraseModel.fromJson(
          json['currentPhrase'] as Map<String, dynamic>),
      vocabularyEntries: (json['vocabularyEntries'] as List<dynamic>)
          .map((e) => VocabularyEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$DailyProgressModelToJson(_DailyProgressModel instance) =>
    <String, dynamic>{
      'totalPoints': instance.totalPoints,
      'currentQuizQuestion':
          instance.currentQuizQuestion.map((e) => e.toJson()).toList(),
      'currentWord': instance.currentWord.toJson(),
      'currentPhrase': instance.currentPhrase.toJson(),
      'vocabularyEntries':
          instance.vocabularyEntries.map((e) => e.toJson()).toList(),
      'isComplete': instance.isComplete,
    };
