import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/data/services/paginated_firestore/firestore_paging_controller.dart';
import 'package:lang_bridge/src/leaderboard/components/word_card.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final FirestorePagingController<CategorynModel> customPaging =
      FirestorePagingController<CategorynModel>(
          pageSize: 3,
          collection: FirebaseFirestore.instance.collection('categories'),
          fromJson: CategorynModel.fromJson,
          getId: (item) => item.id,
          initialFilters: [
        FirestoreFilter.isEqualTo('category', widget.category.toLowerCase()),
      ]);
  @override
  void dispose() {
    customPaging.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: RefreshIndicator(
        onRefresh: () async => customPaging.refresh(),
        child: PagedListView.separated(
          pagingController: customPaging.pagingController,
          builderDelegate: PagedChildBuilderDelegate<CategorynModel>(
            itemBuilder: (context, word, index) => WordCard(
              key: ValueKey(word.id),
              english: word.english,
              arabic: word.arabic,
              arabicPronunciation: word.arabicPronunciation,
              englishPronunciation: word.englishPronunciation,
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}
