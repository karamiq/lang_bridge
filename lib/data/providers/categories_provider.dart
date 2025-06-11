import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/data/services/clients/_clients.dart';

part 'categories_provider.g.dart';

@riverpod
Future<List<CategorynModel>> categories(
  Ref ref, {
  required String title,
  required String category,
  required CategorynModel? startAfterDoc,
  int limit = 10,
}) async {
  final firestore = FirebaseFirestore.instance;

  // Build the base query
  var query = firestore
      .collection('categories')
      .where(
        'category',
        isEqualTo: category.toLowerCase(),
      )
      .limit(limit);

  if (startAfterDoc != null) {
    final startAfterDocSnapshot = await firestore.collection('categories').doc(startAfterDoc.id).get();
    query = query.startAfterDocument(startAfterDocSnapshot);
  }

  final querySnapshot = await query.get();
  final data = querySnapshot.docs.map((doc) => CategorynModel.fromJson(doc.data())).toList();

  if (title.isNotEmpty) {
    return data.where((item) {
      final queryText = title.toLowerCase().trim();
      return item.arabic.toLowerCase().contains(queryText) || item.english.toLowerCase().contains(queryText);
    }).toList();
  }
  return data;
}
