import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'package:lang_bridge/data/services/paginated_firestore/firestore_paging_controller.dart';
import 'package:lang_bridge/paging/paging_list_delegate.dart';
import 'package:lang_bridge/src/learn/pages/phrases/components/filter_bottom_sheet.dart';
import 'package:lang_bridge/src/learn/pages/phrases/components/phrase_card.dart';

class PhrasesPage extends HookConsumerWidget {
  const PhrasesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState<PhraseEnum?>(null);
    final colorScheme = Theme.of(context).colorScheme;

    final pagingController = useMemoized(() => FirestorePagingController<CategorynModel>(
          collection: FirebaseFirestore.instance.collection('phrases'),
          fromJson: CategorynModel.fromJson,
          getId: (item) => item.id,
        ));

    useEffect(() {
      return () => pagingController.dispose();
    }, []);

    void showFilterMenu() {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: false,
        builder: (context) => FilterBottomSheet(
          categories: PhraseEnum.values,
          selectedCategory: selectedCategory.value,
          onCategorySelected: (category) {
            selectedCategory.value = category;
            pagingController.setFilters([
              FirestoreFilter.isEqualTo('category', category?.toJson()),
            ]);
          },
        ),
      );
    }

    bool isAllSelected() {
      return selectedCategory.value == null;
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color:
                isAllSelected() ? colorScheme.surfaceContainerHighest : colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isAllSelected()
                  ? colorScheme.outline.withOpacity(0.3)
                  : colorScheme.primary.withOpacity(0.3),
            ),
          ),
          child: InkWell(
            onTap: showFilterMenu,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedCategory.value?.name(context) ?? context.l10n.all,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isAllSelected() ? colorScheme.onSurfaceVariant : colorScheme.primary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: isAllSelected() ? colorScheme.onSurfaceVariant : colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: PagedListView.separated(
        pagingController: pagingController.pagingController,
        builderDelegate: defaultListPagedChildBuilderDelegate<CategorynModel>(
          controller: pagingController.pagingController,
          context: context,
          itemBuilder: (context, phrase, index) {
            return PhraseCard(
              phrase: phrase,
            );
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: Insets.medium),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.colorScheme,
    this.selectedCategory,
  });

  final ColorScheme colorScheme;
  final PhraseEnum? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No phrases found',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            selectedCategory == null
                ? 'No phrases are available at the moment'
                : 'No phrases found in ${selectedCategory!.name(context)} category',
            style: TextStyle(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading phrases...',
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.colorScheme,
    required this.onRetry,
    this.errorMessage,
  });

  final ColorScheme colorScheme;
  final VoidCallback onRetry;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load phrases',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage ?? 'Something went wrong. Please try again.',
            style: TextStyle(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
