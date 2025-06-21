// daily_provider.dart
// ignore_for_file: unused_result, avoid_types_as_parameter_names

import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/models/daily_progress_model.dart';
import 'package:lang_bridge/data/models/saying_model.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';
import 'package:lang_bridge/data/models/daily_models.dart';

part 'daily_provider.g.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final random = Random();

@riverpod
class UpdateProgress extends _$UpdateProgress with AsyncXNotifierMixin<dynamic> {
  @override
  Future<AsyncX<dynamic>> build() => idle();

  @useResult
  RunXCallback<dynamic> run(DailyProgressModel progress) => handle(() async {
        progress = progress.copyWith(isComplete: true);
        final user = ref.watch(authenticationProvider)!;

        await firestore.collection('users').doc(user.uid).update({
          'points': progress.totalPoints + user.points,
        });
        final today = DateTime.now().toIso8601String().split('T').first;
        await firestore
            .collection('users')
            .doc(user.uid)
            .collection('daily_progress')
            .doc(today)
            .set(progress.toJson());
      });
}

@riverpod
Future<List<SayingModel>> dailySaying(Ref ref) async {
  final snapshot = await firestore.collection('sayings').get();
  var sayings = snapshot.docs.map((doc) => SayingModel.fromJson(doc.data())).toList();
  sayings.shuffle();
  return sayings.take(7).toList();
}

@riverpod
Future<DailyWordModel> dailyWord(Ref ref) async {
  final snapshot = await firestore.collection('daily_words').get();
  final randomIndex = random.nextInt(snapshot.docs.length);
  final doc = snapshot.docs[randomIndex];
  return DailyWordModel.fromJson(doc.data());
}

@riverpod
Future<DailyPhraseModel> dailyPhrase(Ref ref) async {
  final snapshot = await firestore.collection('daily_phrases').get();
  final randomIndex = random.nextInt(snapshot.docs.length);
  final doc = snapshot.docs[randomIndex];
  return DailyPhraseModel.fromJson(doc.data());
}

@riverpod
Future<List<QuizQuestionModel>> daillyQuizQuestion(Ref ref) async {
  final snapshot = await firestore.collection('daily_quiz_questions').get();
  final docs = snapshot.docs.map((doc) => QuizQuestionModel.fromJson(doc.data())).toList();
  docs.shuffle();
  return docs.take(3).toList();
}

@riverpod
Future<List<VocabularyEntryModel>> vocabularyEntries(Ref ref) async {
  final snapshot = await firestore.collection('daily_vocabulary').get();
  final entries = snapshot.docs.map((doc) => VocabularyEntryModel.fromJson(doc.data())).toList();
  entries.shuffle();
  return entries.take(5).toList();
}

@riverpod
class Daily extends _$Daily {
  @override
  Future<DailyProgressModel> build() async {
    final authUser = ref.watch(authenticationProvider);
    final user = authUser!;
    return await _loadProgress(user);
  }

  Future<DailyProgressModel> _loadProgress(AuthenticationModel user) async {
    final dailyWord = await ref.watch(dailyWordProvider.future);
    final dailyPhrase = await ref.watch(dailyPhraseProvider.future);
    final quizQuestion = await ref.watch(daillyQuizQuestionProvider.future);
    final vocabulary = await ref.watch(vocabularyEntriesProvider.future);

    final today = DateTime.now().toIso8601String().split('T').first;
    final doc =
        await firestore.collection('users').doc(user.uid).collection('daily_progress').doc(today).get();

    if (doc.exists) {
      final progress = DailyProgressModel.fromJson(doc.data()!);
      if (progress.isComplete) return progress;
    }

    final int points = dailyPhrase.points +
        dailyWord.points +
        quizQuestion.fold<int>(0, (sum, q) => sum + q.points) +
        vocabulary.fold<int>(0, (sum, v) => sum + v.points);

    return DailyProgressModel(
      totalPoints: points,
      currentQuizQuestion: quizQuestion,
      currentWord: dailyWord,
      currentPhrase: dailyPhrase,
      vocabularyEntries: vocabulary,
      isComplete: false,
    );
  }
}
