import 'package:lang_bridge/data/models/_models.dart';
import 'package:lang_bridge/data/models/daily_models.dart';
part 'daily_progress_model.freezed.dart';
part 'daily_progress_model.g.dart';

@freezed
abstract class DailyProgressModel with _$DailyProgressModel {
  @jsonSerializable
  const factory DailyProgressModel({
    required int totalPoints,
    required List<QuizQuestionModel> currentQuizQuestion,
    required DailyWordModel currentWord,
    required DailyPhraseModel currentPhrase,
    required List<VocabularyEntryModel> vocabularyEntries,
    required bool isComplete,
  }) = _DailyProgressModel;

  factory DailyProgressModel.fromJson(Map<String, dynamic> data) => _$DailyProgressModelFromJson(data);
  @override
  Map<String, dynamic> toJson() => _$DailyProgressModelToJson(this as _DailyProgressModel);
}

// models/quiz_state_model.dart
@freezed
abstract class QuizStateModel with _$QuizStateModel {
  @jsonSerializable
  const factory QuizStateModel({
    required int? selectedAnswer,
    required bool showResult,
    required bool? isCorrect,
    required int earnedPoints,
  }) = _QuizStateModel;

  factory QuizStateModel.initial() => const QuizStateModel(
        selectedAnswer: null,
        showResult: false,
        isCorrect: null,
        earnedPoints: 0,
      );
}
