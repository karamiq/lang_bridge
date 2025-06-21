// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_practice_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListeningPracticePerformanceModel _$ListeningPracticePerformanceModelFromJson(
        Map<String, dynamic> json) =>
    _ListeningPracticePerformanceModel(
      completedAt: DateTime.parse(json['completedAt'] as String),
      languageCode: json['languageCode'] as String,
      totalSentences: (json['totalSentences'] as num).toInt(),
      averageAccuracy: (json['averageAccuracy'] as num).toInt(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      sentencePerformances: (json['sentencePerformances'] as List<dynamic>)
          .map((e) => ListeningPracticeSentenceModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      totalTimeSpent:
          Duration(microseconds: (json['totalTimeSpent'] as num).toInt()),
    );

Map<String, dynamic> _$ListeningPracticePerformanceModelToJson(
        _ListeningPracticePerformanceModel instance) =>
    <String, dynamic>{
      'completedAt': instance.completedAt.toIso8601String(),
      'languageCode': instance.languageCode,
      'totalSentences': instance.totalSentences,
      'averageAccuracy': instance.averageAccuracy,
      'totalPoints': instance.totalPoints,
      'sentencePerformances':
          instance.sentencePerformances.map((e) => e.toJson()).toList(),
      'totalTimeSpent': instance.totalTimeSpent.inMicroseconds,
    };

_ListeningPracticeSentenceModel _$ListeningPracticeSentenceModelFromJson(
        Map<String, dynamic> json) =>
    _ListeningPracticeSentenceModel(
      id: json['id'] as String,
      english: json['english'] as String,
      arabic: json['arabic'] as String,
    );

Map<String, dynamic> _$ListeningPracticeSentenceModelToJson(
        _ListeningPracticeSentenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english': instance.english,
      'arabic': instance.arabic,
    };

_WordComparisonModel _$WordComparisonModelFromJson(Map<String, dynamic> json) =>
    _WordComparisonModel(
      targetWord: json['targetWord'] as String,
      userWord: json['userWord'] as String,
      isCorrect: json['isCorrect'] as bool,
      position: (json['position'] as num).toInt(),
      type: $enumDecode(_$WordComparisonTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$WordComparisonModelToJson(
        _WordComparisonModel instance) =>
    <String, dynamic>{
      'targetWord': instance.targetWord,
      'userWord': instance.userWord,
      'isCorrect': instance.isCorrect,
      'position': instance.position,
      'type': instance.type.toJson(),
    };

const _$WordComparisonTypeEnumMap = {
  WordComparisonType.exact: 'exact',
  WordComparisonType.similar: 'similar',
  WordComparisonType.wrong: 'wrong',
  WordComparisonType.missing: 'missing',
  WordComparisonType.extra: 'extra',
};

_SentenceResultModel _$SentenceResultModelFromJson(Map<String, dynamic> json) =>
    _SentenceResultModel(
      sentenceId: json['sentenceId'] as String,
      userInput: json['userInput'] as String,
      targetText: json['targetText'] as String,
      accuracy: (json['accuracy'] as num).toInt(),
      wordComparisons: (json['wordComparisons'] as List<dynamic>)
          .map(WordComparisonModel.fromJson)
          .toList(),
      completedAt: DateTime.parse(json['completedAt'] as String),
      attempts: (json['attempts'] as num).toInt(),
    );

Map<String, dynamic> _$SentenceResultModelToJson(
        _SentenceResultModel instance) =>
    <String, dynamic>{
      'sentenceId': instance.sentenceId,
      'userInput': instance.userInput,
      'targetText': instance.targetText,
      'accuracy': instance.accuracy,
      'wordComparisons':
          instance.wordComparisons.map((e) => e.toJson()).toList(),
      'completedAt': instance.completedAt.toIso8601String(),
      'attempts': instance.attempts,
    };
