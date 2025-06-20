import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';

part 'activities_provider.g.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final today = DateTime.now().toIso8601String().split('T').first;

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
        await _updatingQuery('memory_game').set(game.toJson());
      });

  _updatingQuery(String collectionName) {
    return firestore.collection('users').doc(user.uid).collection(collectionName).doc(today);
  }
}
