import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/components/search_text_field.dart';
import 'package:lang_bridge/data/models/story_model.dart';
import 'package:lang_bridge/data/providers/stories_provider.dart';
import 'package:lang_bridge/paging/paging_list_delegate.dart';
import 'package:lang_bridge/src/learn/pages/stories/components/story_card.dart';
import 'package:lang_bridge/utils/widgets/form_fields/custom_drop_down_button.dart';

class StoriesPage extends ConsumerStatefulWidget {
  const StoriesPage({super.key});

  @override
  ConsumerState<StoriesPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<StoriesPage> {
  final TextEditingController _searchController = TextEditingController();
  final _pagingController = PagingController<int, StoryModel>(
    firstPageKey: 1,
  );
  final selectedLevelNotifier = ValueNotifier<EnglishLevelEnum?>(null);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((int pageKey) async {
      try {
        final startAfterDoc = pageKey == 1 ? null : _pagingController.itemList?.last;
        final page = await ref.read(storiesProvider(
          title: _searchController.text.toLowerCase().trim(),
          englishLevel: selectedLevelNotifier.value,
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              searchController: _searchController,
              onChange: (p0) => _pagingController.refresh(),
            ),
            const SizedBox(height: Insets.small),
            ValueListenableBuilder(
                valueListenable: selectedLevelNotifier,
                builder: (context, selectedStatus, child) {
                  return CustomDropdownButtonFormField<EnglishLevelEnum>(
                    value: selectedStatus,
                    items: List.generate(EnglishLevelEnum.values.length, (index) {
                      final level = EnglishLevelEnum.values[index];
                      return DropdownMenuItem(
                        key: ValueKey(level),
                        value: level,
                        child: Text(level.name(context)),
                      );
                    }),
                    hintText: context.l10n.selectLevel,
                    onChanged: (value) {
                      selectedLevelNotifier.value = value;
                      _pagingController.refresh();
                    },
                    suffixIcon: selectedStatus == null
                        ? null
                        : IconButton(
                            onPressed: () {
                              selectedLevelNotifier.value = null;
                              _pagingController.refresh();
                            },
                            icon: const Icon(Icons.close),
                          ),
                  );
                }),
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
                        itemBuilder: (context, story, index) => StoryCard(
                          story: story,
                          onTap: () {
                            context.push(
                              RoutesDocument.learnStoriesStory(
                                story.id,
                              ),
                              extra: story,
                            );
                          },
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: Insets.medium)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:lang_bridge/common_lib.dart';
// import 'package:lang_bridge/components/search_text_field.dart';
// import 'package:lang_bridge/data/models/story_model.dart';
// import 'package:lang_bridge/data/services/paginated_firestore/firestore_paging_controller.dart';
// import 'package:lang_bridge/paging/paging_list_delegate.dart';
// import 'package:lang_bridge/src/learn/pages/stories/components/story_card.dart';
// import 'package:lang_bridge/utils/widgets/form_fields/custom_drop_down_button.dart';

// class StoriesPage extends StatefulHookConsumerWidget {
//   const StoriesPage({super.key});

//   @override
//   ConsumerState<StoriesPage> createState() => _CategoryPageState();
// }

// class _CategoryPageState extends ConsumerState<StoriesPage> {
//   final TextEditingController _searchController = TextEditingController();
//   late FirestorePagingController<StoryModel> _pagingController;

//   @override
//   void initState() {
//     super.initState();
//     _pagingController = _createPagingController();
//   }

//   FirestorePagingController<StoryModel> _createPagingController() {
//     return FirestorePagingController<StoryModel>(
//       searchConfig:
//           FirestoreSearchConfig(field: 'titleEn', value: _searchController.text.trim().toLowerCase()),
//       collection: FirebaseFirestore.instance.collection('stories'),
//       fromJson: StoryModel.fromJson,
//       getId: (item) => item.id,
//     );
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _pagingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedLevel = useState<EnglishLevelEnum?>(null);
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SearchTextField(
//                 searchController: _searchController,
//                 onChange: (value) {
//                   _pagingController.setSearchConfig(
//                     FirestoreSearchConfig(
//                       field: 'titleEn',
//                       value: value.trim().toLowerCase(),
//                     ),
//                   );
//                 }),
//             const SizedBox(height: Insets.small),
//             ValueListenableBuilder(
//                 valueListenable: selectedLevel,
//                 builder: (context, selectedStatus, child) {
//                   return CustomDropdownButtonFormField<EnglishLevelEnum>(
//                     value: selectedStatus,
//                     items: List.generate(EnglishLevelEnum.values.length, (index) {
//                       final level = EnglishLevelEnum.values[index];
//                       return DropdownMenuItem(
//                         key: ValueKey(level),
//                         value: level,
//                         child: Text(level.name(context)),
//                       );
//                     }),
//                     hintText: context.l10n.selectLevel,
//                     onChanged: (value) {
//                       selectedLevel.value = value;
//                       _pagingController.setFilters([
//                         FirestoreFilter.isEqualTo('level', value?.toJson()),
//                       ]);
//                     },
//                     suffixIcon: _pagingController.filters.isEmpty
//                         ? null
//                         : IconButton(
//                             onPressed: () {
//                               selectedLevel.value = null;
//                               _pagingController.clearFilters();
//                             },
//                             icon: const Icon(Icons.close),
//                           ),
//                   );
//                 }),
//             const SizedBox(height: Insets.medium),
//             Expanded(
//               child: RefreshIndicator(
//                 onRefresh: () async => _pagingController.refresh(),
//                 child: Scrollbar(
//                   child: PagedListView.separated(
//                       pagingController: _pagingController.pagingController,
//                       builderDelegate: defaultListPagedChildBuilderDelegate<StoryModel>(
//                         controller: _pagingController.pagingController,
//                         context: context,
//                         itemBuilder: (context, story, index) => StoryCard(
//                           story: story,
//                           onTap: () {
//                             context.push(
//                               RoutesDocument.learnStoriesStory(
//                                 story.id,
//                               ),
//                               extra: story,
//                             );
//                           },
//                         ),
//                       ),
//                       separatorBuilder: (context, index) => const SizedBox(height: Insets.medium)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
