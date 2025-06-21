import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/listening_practice_models.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';

part 'listening_practice_provider.g.dart';

@riverpod
Future<List<ListeningPracticeSentenceModel>> listeningPractice(Ref ref) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('listening_practice_sentences')
      .withConverter<ListeningPracticeSentenceModel>(
        fromFirestore: (snapshot, _) => ListeningPracticeSentenceModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      )
      .get();
  final allDocs = snapshot.docs.map((doc) => doc.data()).toList();
  allDocs.shuffle();
  return allDocs.take(3).toList();
}
