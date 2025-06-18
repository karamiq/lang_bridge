import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_models.freezed.dart';
part 'daily_models.g.dart';

@freezed
abstract class DailyWordModel with _$DailyWordModel {
  const factory DailyWordModel({
    required String arabicWord,
    required String englishWord,
    required String pronunciation,
    required String exampleArabic,
    required String exampleEnglish,
    required int points,
  }) = _DailyWordModel;

  factory DailyWordModel.fromJson(Map<String, dynamic> json) => _$DailyWordModelFromJson(json);
}

@freezed
abstract class DailyPhraseModel with _$DailyPhraseModel {
  const factory DailyPhraseModel({
    required String arabicPhrase,
    required String englishPhrase,
    required String pronunciation,
    required String responseArabic,
    required String responseEnglish,
    required int points,
  }) = _DailyPhraseModel;

  factory DailyPhraseModel.fromJson(Map<String, dynamic> json) => _$DailyPhraseModelFromJson(json);
}

@freezed
abstract class QuizQuestionModel with _$QuizQuestionModel {
  const factory QuizQuestionModel({
    required String question,
    required List<String> options,
    required int correctIndex,
    required int points,
  }) = _QuizQuestionModel;

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) => _$QuizQuestionModelFromJson(json);
}

@freezed
abstract class VocabularyEntryModel with _$VocabularyEntryModel {
  const factory VocabularyEntryModel({
    required String arabic,
    required String english,
    required String category,
    required String pronunciation,
    required int points,
  }) = _VocabularyEntryModel;

  factory VocabularyEntryModel.fromJson(Map<String, dynamic> json) => _$VocabularyEntryModelFromJson(json);
}
