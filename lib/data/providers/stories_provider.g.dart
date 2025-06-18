// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storiesHash() => r'cc36451795f826fd2dd18b6c8d331aef6a5412b0';

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

/// See also [stories].
@ProviderFor(stories)
const storiesProvider = StoriesFamily();

/// See also [stories].
class StoriesFamily extends Family<AsyncValue<List<StoryModel>>> {
  /// See also [stories].
  const StoriesFamily();

  /// See also [stories].
  StoriesProvider call({
    String? title,
    EnglishLevelEnum? englishLevel,
    StoryModel? startAfterDoc,
    int limit = 10,
  }) {
    return StoriesProvider(
      title: title,
      englishLevel: englishLevel,
      startAfterDoc: startAfterDoc,
      limit: limit,
    );
  }

  @override
  StoriesProvider getProviderOverride(
    covariant StoriesProvider provider,
  ) {
    return call(
      title: provider.title,
      englishLevel: provider.englishLevel,
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
  String? get name => r'storiesProvider';
}

/// See also [stories].
class StoriesProvider extends AutoDisposeFutureProvider<List<StoryModel>> {
  /// See also [stories].
  StoriesProvider({
    String? title,
    EnglishLevelEnum? englishLevel,
    StoryModel? startAfterDoc,
    int limit = 10,
  }) : this._internal(
          (ref) => stories(
            ref as StoriesRef,
            title: title,
            englishLevel: englishLevel,
            startAfterDoc: startAfterDoc,
            limit: limit,
          ),
          from: storiesProvider,
          name: r'storiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storiesHash,
          dependencies: StoriesFamily._dependencies,
          allTransitiveDependencies: StoriesFamily._allTransitiveDependencies,
          title: title,
          englishLevel: englishLevel,
          startAfterDoc: startAfterDoc,
          limit: limit,
        );

  StoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.englishLevel,
    required this.startAfterDoc,
    required this.limit,
  }) : super.internal();

  final String? title;
  final EnglishLevelEnum? englishLevel;
  final StoryModel? startAfterDoc;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<StoryModel>> Function(StoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StoriesProvider._internal(
        (ref) => create(ref as StoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        englishLevel: englishLevel,
        startAfterDoc: startAfterDoc,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<StoryModel>> createElement() {
    return _StoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StoriesProvider &&
        other.title == title &&
        other.englishLevel == englishLevel &&
        other.startAfterDoc == startAfterDoc &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, englishLevel.hashCode);
    hash = _SystemHash.combine(hash, startAfterDoc.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StoriesRef on AutoDisposeFutureProviderRef<List<StoryModel>> {
  /// The parameter `title` of this provider.
  String? get title;

  /// The parameter `englishLevel` of this provider.
  EnglishLevelEnum? get englishLevel;

  /// The parameter `startAfterDoc` of this provider.
  StoryModel? get startAfterDoc;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _StoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<StoryModel>> with StoriesRef {
  _StoriesProviderElement(super.provider);

  @override
  String? get title => (origin as StoriesProvider).title;
  @override
  EnglishLevelEnum? get englishLevel =>
      (origin as StoriesProvider).englishLevel;
  @override
  StoryModel? get startAfterDoc => (origin as StoriesProvider).startAfterDoc;
  @override
  int get limit => (origin as StoriesProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
