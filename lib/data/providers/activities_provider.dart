import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/models/listening_practice_models.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';

part 'activities_provider.g.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

@riverpod
class Activities extends _$Activities with AsyncXNotifierMixin<dynamic> {
  // ignore: avoid_public_notifier_properties
  AuthenticationModel get user => ref.watch(authenticationProvider)!;
  @override
  Future<AsyncX<dynamic>> build() {
    return idle();
  }

  @useResult
  RunXCallback<dynamic> memory(MemeoryGameModel game) => handle(() async {
        await firestore.collection('users').doc(user.uid).update({
          'points': game.points + user.points,
        });
        await _updatingQuery('memory_game').add(game.toJson());
      });

  @useResult
  RunXCallback<dynamic> listening(ListeningPracticePerformanceModel listening) => handle(() async {
        await firestore.collection('users').doc(user.uid).update({
          'points': listening.totalPoints + user.points,
        });
        await _updatingQuery('listening_practice').add(listening.toJson());
      });

  @useResult
  RunXCallback<dynamic> writing(quiz) => handle(() async {
        await firestore.collection('users').doc(user.uid).update({
          'points': quiz.points + user.points,
        });
        await _updatingQuery('writing_practice').add(quiz.toJson());
      });

  CollectionReference<Map<String, dynamic>> _updatingQuery(String collectionName) {
    return firestore.collection('users').doc(user.uid).collection(collectionName);
  }
}
