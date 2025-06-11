// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'b63b44b3a0ea462145ca935cf413eedce0f5c9cb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categories].
@ProviderFor(categories)
const categoriesProvider = CategoriesFamily();

/// See also [categories].
class CategoriesFamily extends Family<AsyncValue<List<CategorynModel>>> {
  /// See also [categories].
  const CategoriesFamily();

  /// See also [categories].
  CategoriesProvider call({
    required String title,
    required String category,
    required CategorynModel? startAfterDoc,
    int limit = 10,
  }) {
    return CategoriesProvider(
      title: title,
      category: category,
      startAfterDoc: startAfterDoc,
      limit: limit,
    );
  }

  @override
  CategoriesProvider getProviderOverride(
    covariant CategoriesProvider provider,
  ) {
    return call(
      title: provider.title,
      category: provider.category,
      startAfterDoc: provider.startAfterDoc,
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoriesProvider';
}

/// See also [categories].
class CategoriesProvider
    extends AutoDisposeFutureProvider<List<CategorynModel>> {
  /// See also [categories].
  CategoriesProvider({
    required String title,
    required String category,
    required CategorynModel? startAfterDoc,
    int limit = 10,
  }) : this._internal(
          (ref) => categories(
            ref as CategoriesRef,
            title: title,
            category: category,
            startAfterDoc: startAfterDoc,
            limit: limit,
          ),
          from: categoriesProvider,
          name: r'categoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoriesHash,
          dependencies: CategoriesFamily._dependencies,
          allTransitiveDependencies:
              CategoriesFamily._allTransitiveDependencies,
          title: title,
          category: category,
          startAfterDoc: startAfterDoc,
          limit: limit,
        );

  CategoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.category,
    required this.startAfterDoc,
    required this.limit,
  }) : super.internal();

  final String title;
  final String category;
  final CategorynModel? startAfterDoc;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<CategorynModel>> Function(CategoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoriesProvider._internal(
        (ref) => create(ref as CategoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        category: category,
        startAfterDoc: startAfterDoc,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CategorynModel>> createElement() {
    return _CategoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesProvider &&
        other.title == title &&
        other.category == category &&
        other.startAfterDoc == startAfterDoc &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, startAfterDoc.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoriesRef on AutoDisposeFutureProviderRef<List<CategorynModel>> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `category` of this provider.
  String get category;

  /// The parameter `startAfterDoc` of this provider.
  CategorynModel? get startAfterDoc;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _CategoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<CategorynModel>>
    with CategoriesRef {
  _CategoriesProviderElement(super.provider);

  @override
  String get title => (origin as CategoriesProvider).title;
  @override
  String get category => (origin as CategoriesProvider).category;
  @override
  CategorynModel? get startAfterDoc =>
      (origin as CategoriesProvider).startAfterDoc;
  @override
  int get limit => (origin as CategoriesProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
