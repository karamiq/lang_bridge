import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

typedef FirestoreQueryBuilder<T> = Query<Map<String, dynamic>> Function(
    Query<Map<String, dynamic>> baseQuery);

/// Filter types enum for better type safety
enum FilterType {
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  arrayContainsAny,
  whereIn,
  whereNotIn,
  isNull,
  isNotNull,
}

/// Filter class to define individual filters
class FirestoreFilter {
  final String field;
  final FilterType type;
  final dynamic value;

  const FirestoreFilter({
    required this.field,
    required this.type,
    this.value,
  });

  // Convenience constructors for common filters
  FirestoreFilter.isEqualTo(this.field, this.value) : type = FilterType.isEqualTo;
  FirestoreFilter.isNotEqualTo(this.field, this.value) : type = FilterType.isNotEqualTo;
  FirestoreFilter.isLessThan(this.field, this.value) : type = FilterType.isLessThan;
  FirestoreFilter.isLessThanOrEqualTo(this.field, this.value) : type = FilterType.isLessThanOrEqualTo;
  FirestoreFilter.isGreaterThan(this.field, this.value) : type = FilterType.isGreaterThan;
  FirestoreFilter.isGreaterThanOrEqualTo(this.field, this.value) : type = FilterType.isGreaterThanOrEqualTo;
  FirestoreFilter.arrayContains(this.field, this.value) : type = FilterType.arrayContains;
  FirestoreFilter.arrayContainsAny(this.field, this.value) : type = FilterType.arrayContainsAny;
  FirestoreFilter.whereIn(this.field, this.value) : type = FilterType.whereIn;
  FirestoreFilter.whereNotIn(this.field, this.value) : type = FilterType.whereNotIn;
  FirestoreFilter.isNull(this.field)
      : type = FilterType.isNull,
        value = null;
  FirestoreFilter.isNotNull(this.field)
      : type = FilterType.isNotNull,
        value = null;

  @override
  String toString() => 'FirestoreFilter(field: $field, type: $type, value: $value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirestoreFilter &&
          runtimeType == other.runtimeType &&
          field == other.field &&
          type == other.type &&
          value == other.value;

  @override
  int get hashCode => field.hashCode ^ type.hashCode ^ value.hashCode;
}

/// Order by class for sorting
class FirestoreOrderBy {
  final String field;
  final bool descending;

  const FirestoreOrderBy({
    required this.field,
    this.descending = false,
  });

  FirestoreOrderBy.asc(this.field) : descending = false;
  FirestoreOrderBy.desc(this.field) : descending = true;

  @override
  String toString() => 'FirestoreOrderBy(field: $field, descending: $descending)';
}

/// Enhanced search configuration
class FirestoreSearchConfig {
  final String field;
  final String value;
  final bool caseSensitive;
  final bool exactMatch;

  const FirestoreSearchConfig({
    required this.field,
    required this.value,
    this.caseSensitive = false,
    this.exactMatch = false,
  });

  @override
  String toString() =>
      'FirestoreSearchConfig(field: $field, value: $value, caseSensitive: $caseSensitive, exactMatch: $exactMatch)';
}

class FirestorePagingController<T> {
  final PagingController<int, T> pagingController;
  final CollectionReference<Map<String, dynamic>> collection;
  final T Function(Map<String, dynamic> json) fromJson;
  final int pageSize;
  final FirestoreQueryBuilder<T>? buildQuery;
  final String Function(T) getId;

  // Filter and ordering lists - made mutable
  final List<FirestoreFilter> _filters = [];
  final List<FirestoreOrderBy> _orderBy = [];
  FirestoreSearchConfig? searchConfig;

  // Last document for pagination
  DocumentSnapshot? _lastDocument;

  FirestorePagingController({
    required this.collection,
    required this.fromJson,
    required this.getId,
    this.pageSize = 20,
    this.buildQuery,
    this.searchConfig,
    List<FirestoreFilter>? initialFilters,
    List<FirestoreOrderBy>? initialOrderBy,
  }) : pagingController = PagingController<int, T>(firstPageKey: 0) {
    if (initialFilters != null) _filters.addAll(initialFilters);
    if (initialOrderBy != null) _orderBy.addAll(initialOrderBy);

    pagingController.addPageRequestListener(_fetchPage);
  }

  // Getters for immutable access
  List<FirestoreFilter> get filters => List.unmodifiable(_filters);
  List<FirestoreOrderBy> get orderBy => List.unmodifiable(_orderBy);

  /// Add a single filter
  void addFilter(FirestoreFilter filter) {
    _filters.add(filter);
    _resetPagination();
  }

  /// Add multiple filters
  void addFilters(List<FirestoreFilter> filters) {
    _filters.addAll(filters);
    _resetPagination();
  }

  /// Remove a filter by field name
  void removeFilter(String field) {
    _filters.removeWhere((filter) => filter.field == field);
    _resetPagination();
  }

  /// Remove all filters with a specific type
  void removeFiltersByType(FilterType type) {
    _filters.removeWhere((filter) => filter.type == type);
    _resetPagination();
  }

  /// Clear all filters
  void clearFilters() {
    _filters.clear();
    _resetPagination();
  }

  /// Replace all filters
  void setFilters(List<FirestoreFilter> newFilters) {
    _filters
      ..clear()
      ..addAll(newFilters);
    _resetPagination();
  }

  /// Add ordering
  void addOrderBy(FirestoreOrderBy order) {
    _orderBy.add(order);
    _resetPagination();
  }

  /// Set ordering (replaces existing)
  void setOrderBy(List<FirestoreOrderBy> orders) {
    _orderBy
      ..clear()
      ..addAll(orders);
    _resetPagination();
  }

  /// Clear ordering
  void clearOrderBy() {
    _orderBy.clear();
    _resetPagination();
  }

  /// Enhanced text search functionality
  void setSearch(FirestoreSearchConfig newSearchConfig) {
    searchConfig = newSearchConfig;
    _resetPagination();
  }

  /// Clear text search
  void clearSearch() {
    searchConfig = null;
    _resetPagination();
  }

  /// Check if a filter exists for a field
  bool hasFilter(String field) {
    return _filters.any((filter) => filter.field == field);
  }

  /// Get filter for a specific field
  FirestoreFilter? getFilter(String field) {
    try {
      return _filters.firstWhere((filter) => filter.field == field);
    } catch (e) {
      return null;
    }
  }

  /// Get filter value for a specific field
  dynamic getFilterValue(String field) {
    final filter = getFilter(field);
    return filter?.value;
  }

  /// Apply filters, search, and ordering to query
  Query<Map<String, dynamic>> _buildQuery(Query<Map<String, dynamic>> baseQuery) {
    Query<Map<String, dynamic>> query = baseQuery;

    // Apply custom query builder first
    if (buildQuery != null) {
      query = buildQuery!(query);
    }

    // Apply filters
    for (final filter in _filters) {
      query = _applyFilter(query, filter);
    }

    // Apply search logic
    if (searchConfig != null) {
      query = _applySearch(query, searchConfig!);
    }

    // Apply ordering
    for (final order in _orderBy) {
      query = query.orderBy(order.field, descending: order.descending);
    }

    return query;
  }

  /// Apply a single filter to the query
  Query<Map<String, dynamic>> _applyFilter(
    Query<Map<String, dynamic>> query,
    FirestoreFilter filter,
  ) {
    switch (filter.type) {
      case FilterType.isEqualTo:
        return query.where(filter.field, isEqualTo: filter.value);
      case FilterType.isNotEqualTo:
        return query.where(filter.field, isNotEqualTo: filter.value);
      case FilterType.isLessThan:
        return query.where(filter.field, isLessThan: filter.value);
      case FilterType.isLessThanOrEqualTo:
        return query.where(filter.field, isLessThanOrEqualTo: filter.value);
      case FilterType.isGreaterThan:
        return query.where(filter.field, isGreaterThan: filter.value);
      case FilterType.isGreaterThanOrEqualTo:
        return query.where(filter.field, isGreaterThanOrEqualTo: filter.value);
      case FilterType.arrayContains:
        return query.where(filter.field, arrayContains: filter.value);
      case FilterType.arrayContainsAny:
        return query.where(filter.field, arrayContainsAny: filter.value);
      case FilterType.whereIn:
        return query.where(filter.field, whereIn: filter.value);
      case FilterType.whereNotIn:
        return query.where(filter.field, whereNotIn: filter.value);
      case FilterType.isNull:
        return query.where(filter.field, isNull: true);
      case FilterType.isNotNull:
        return query.where(filter.field, isNull: false);
    }
  }

  /// Apply search logic to the query
  Query<Map<String, dynamic>> _applySearch(
    Query<Map<String, dynamic>> query,
    FirestoreSearchConfig searchConfig,
  ) {
    final searchValue = searchConfig.caseSensitive ? searchConfig.value : searchConfig.value.toLowerCase();

    if (searchConfig.exactMatch) {
      // Exact match search
      return query.where(searchConfig.field, isEqualTo: searchValue);
    } else {
      // Prefix search using range queries
      // This works for string fields and requires proper indexing
      final endValue = searchValue.substring(0, searchValue.length - 1) +
          String.fromCharCode(searchValue.codeUnitAt(searchValue.length - 1) + 1);

      return query
          .where(searchConfig.field, isGreaterThanOrEqualTo: searchValue)
          .where(searchConfig.field, isLessThan: "${endValue}z");
    }
  }

  /// Fetch page data from Firestore
  Future<void> _fetchPage(int pageKey) async {
    try {
      Query<Map<String, dynamic>> query = collection.limit(pageSize);

      // Build the complete query
      query = _buildQuery(query);

      // Apply pagination cursor
      if (pageKey > 0 && _lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final snapshot = await query.get();
      final docs = snapshot.docs;

      // Convert documents to objects
      final newItems = docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Ensure document ID is available
        return fromJson(data);
      }).toList();

      // Update last document for pagination
      if (docs.isNotEmpty) {
        _lastDocument = docs.last;
      }

      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  /// Reset pagination state
  void _resetPagination() {
    _lastDocument = null;
    refresh();
  }

  /// Dispose resources
  void dispose() {
    pagingController.dispose();
  }

  /// Refresh the pagination
  void refresh() => pagingController.refresh();

  // Convenience methods for common filtering scenarios
  void filterByStatus(String status) {
    removeFilter('status');
    addFilter(FirestoreFilter.isEqualTo('status', status));
  }

  void filterByDateRange(String field, DateTime startDate, DateTime endDate) {
    removeFilter('${field}_start');
    removeFilter('${field}_end');
    addFilter(FirestoreFilter.isGreaterThanOrEqualTo(field, startDate));
    addFilter(FirestoreFilter.isLessThanOrEqualTo(field, endDate));
  }

  void filterByCategory(String category) {
    removeFilter('category');
    addFilter(FirestoreFilter.isEqualTo('category', category));
  }

  void filterByTags(List<String> tags) {
    removeFilter('tags');
    addFilter(FirestoreFilter.arrayContainsAny('tags', tags));
  }

  void sortByField(String field, {bool descending = false}) {
    clearOrderBy();
    addOrderBy(FirestoreOrderBy(field: field, descending: descending));
  }

  void sortByCreatedDate({bool descending = true}) {
    sortByField('createdAt', descending: descending);
  }

  void sortByName({bool descending = false}) {
    sortByField('name', descending: descending);
  }

  /// Search by title with prefix matching
  void searchByTitle(String searchTerm, {bool caseSensitive = false}) {
    if (searchTerm.isEmpty) {
      clearSearch();
      return;
    }
    setSearch(FirestoreSearchConfig(
      field: 'title',
      value: searchTerm,
      caseSensitive: caseSensitive,
      exactMatch: false,
    ));
  }

  /// Get current state summary
  Map<String, dynamic> getState() {
    return {
      'filters': _filters.map((f) => f.toString()).toList(),
      'orderBy': _orderBy.map((o) => o.toString()).toList(),
      'search': searchConfig?.toString(),
      'pageSize': pageSize,
      'hasItems': (pagingController.itemList?.isNotEmpty ?? false),
      'itemCount': pagingController.itemList?.length ?? 0,
    };
  }

  void setSearchConfig(FirestoreSearchConfig firestoreSearchConfig) {
    searchConfig = firestoreSearchConfig;
    _resetPagination();
  }
}

// Example model class
class Post {
  final String id;
  final String title;
  final String content;
  final String category;
  final List<String> tags;
  final DateTime createdAt;
  final bool published;
  final int views;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.tags,
    required this.createdAt,
    required this.published,
    required this.views,
  });

  factory Post.fromJson(Map<String, dynamic> json, String docId) {
    return Post(
      id: docId,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      category: json['category'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      published: json['published'] ?? false,
      views: json['views'] ?? 0,
    );
  }
}

// Example usage
class ExampleUsage {
  late FirestorePagingController<Post> controller;

  void initializeController() {
    controller = FirestorePagingController<Post>(
      collection: FirebaseFirestore.instance.collection('posts'),
      fromJson: (json) => Post.fromJson(json, json['id'] ?? ''),
      getId: (post) => post.id,
      initialFilters: [
        FirestoreFilter.isEqualTo('published', true),
      ],
      initialOrderBy: [
        FirestoreOrderBy.desc('createdAt'),
      ],
    );
  }

  void demonstrateUsage() {
    // Initialize
    initializeController();

    // Add various filters
    controller.addFilter(FirestoreFilter.isEqualTo('category', 'technology'));
    controller.addFilter(FirestoreFilter.isGreaterThan('views', 100));

    // Batch add filters
    controller.addFilters([
      FirestoreFilter.arrayContains('tags', 'flutter'),
      FirestoreFilter.isLessThan('createdAt', DateTime.now()),
    ]);

    // Use convenience methods
    controller.filterByStatus('active');
    controller.filterByDateRange(
      'createdAt',
      DateTime.now().subtract(const Duration(days: 30)),
      DateTime.now(),
    );

    // Search functionality
    controller.searchByTitle('flutter tutorial', caseSensitive: false);

    // Sorting
    controller.sortByCreatedDate(descending: true);

    // Check current state
    print('Current controller state: ${controller.getState()}');

    // Query specific filter information
    if (controller.hasFilter('category')) {
      print('Category filter: ${controller.getFilterValue('category')}');
    }

    // Clean up specific filters
    controller.removeFilter('category');

    // Or clear all filters
    controller.clearFilters();
  }

  void dispose() {
    controller.dispose();
  }
}
