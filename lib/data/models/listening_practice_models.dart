import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lang_bridge/utils/annotations/json_serializable.dart';
part 'listening_practice_models.freezed.dart';
part 'listening_practice_models.g.dart';

@freezed
abstract class ListeningPracticePerformanceModel with _$ListeningPracticePerformanceModel {
  @jsonSerializable
  const factory ListeningPracticePerformanceModel({
    required DateTime completedAt,
    required String languageCode,
    required int totalSentences,
    required int averageAccuracy,
    required int totalPoints,
    required List<ListeningPracticeSentenceModel> sentencePerformances,
    required Duration totalTimeSpent,
  }) = _ListeningPracticePerformanceModel;

  factory ListeningPracticePerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$ListeningPracticePerformanceModelFromJson(json);
}

@freezed
abstract class ListeningPracticeSentenceModel with _$ListeningPracticeSentenceModel {
  @jsonSerializable
  const factory ListeningPracticeSentenceModel({
    required String id,
    required String english,
    required String arabic,
  }) = _ListeningPracticeSentenceModel;

  factory ListeningPracticeSentenceModel.fromJson(Map<String, dynamic> json) =>
      _$ListeningPracticeSentenceModelFromJson(json);
}

@freezed
abstract class WordComparisonModel with _$WordComparisonModel {
  @jsonSerializable
  const factory WordComparisonModel({
    required String targetWord,
    required String userWord,
    required bool isCorrect,
    required int position,
    required WordComparisonType type,
  }) = _WordComparisonModel;

  factory WordComparisonModel.fromJson(json) => _$WordComparisonModelFromJson(json);
}

@freezed
abstract class SentenceResultModel with _$SentenceResultModel {
  @jsonSerializable
  const factory SentenceResultModel({
    required String sentenceId,
    required String userInput,
    required String targetText,
    required int accuracy,
    required List<WordComparisonModel> wordComparisons,
    required DateTime completedAt,
    required int attempts,
  }) = _SentenceResultModel;

  factory SentenceResultModel.fromJson(Map<String, dynamic> json) => _$SentenceResultModelFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum WordComparisonType {
  @JsonValue('exact')
  exact,
  @JsonValue('similar')
  similar,
  @JsonValue('wrong')
  wrong,
  @JsonValue('missing')
  missing,
  @JsonValue('extra')
  extra;

  toJson() => _$WordComparisonTypeEnumMap[this];

  fromJson(String value) {
    return _$WordComparisonTypeEnumMap.entries
        .firstWhere(
          (entry) => entry.value == value,
          orElse: () => const MapEntry(WordComparisonType.exact, 'exact'),
        )
        .key;
  }
}
