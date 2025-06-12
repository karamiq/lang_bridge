import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/data/providers/categories_provider.dart';
import 'package:lang_bridge/paging/paging_list_delegate.dart';
import 'package:lang_bridge/src/leaderboard/components/phrases_card.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key, required this.category});

  final String category;

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final _pagingController = PagingController<int, CategorynModel>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((int pageKey) async {
      try {
        final startAfterDoc = pageKey == 1 ? null : _pagingController.itemList?.last;
        final page = await ref.read(categoriesProvider(
          title: _searchController.text.toLowerCase().trim(),
          category: widget.category,
          startAfterDoc: startAfterDoc,
        ).future);

        final isLastPage = page.length < 10;
        if (isLastPage) {
          _pagingController.appendLastPage(page);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(page, nextPageKey);
        }
        // ignore: unused_catch_stack
      } catch (e, stackTrace) {
        _pagingController.error = e;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: Insets.medium),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: context.l10n.search,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(Insets.small),
                      child: SvgPicture.asset(Assets.assetsSvgSearch01,
                          color: context.colorScheme.onSurfaceVariant),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                  controller: _searchController,
                  onChanged: (value) {
                    _pagingController.refresh();
                  },
                ),
              ),
              const SizedBox(height: Insets.medium),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => _pagingController.refresh(),
                  child: Scrollbar(
                    child: PagedListView.separated(
                        pagingController: _pagingController,
                        builderDelegate: defaultListPagedChildBuilderDelegate(
                            context: context,
                            controller: _pagingController,
                            itemBuilder: (context, word, index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                  child: PhraseCard(
                                    key: ValueKey(word.id),
                                    english: word.english,
                                    arabic: word.arabic,
                                    arabicPronunciation: word.arabicPronunciation,
                                    englishPronunciation: word.englishPronunciation,
                                  ),
                                )),
                        separatorBuilder: (context, index) => const SizedBox(height: 0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
