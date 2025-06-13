// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderboardTopPerformancersHash() =>
    r'd26127dddf7eaa3fa9f598b838e9e0529764bada';

/// See also [leaderboardTopPerformancers].
@ProviderFor(leaderboardTopPerformancers)
final leaderboardTopPerformancersProvider =
    AutoDisposeStreamProvider<List<AuthenticationModel>>.internal(
  leaderboardTopPerformancers,
  name: r'leaderboardTopPerformancersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$leaderboardTopPerformancersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeaderboardTopPerformancersRef
    = AutoDisposeStreamProviderRef<List<AuthenticationModel>>;
String _$currentUserRankHash() => r'5fa97cc84fc0acc04cf05135ad31d749ba898ff9';

/// See also [currentUserRank].
@ProviderFor(currentUserRank)
final currentUserRankProvider = AutoDisposeFutureProvider<int>.internal(
  currentUserRank,
  name: r'currentUserRankProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserRankHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRankRef = AutoDisposeFutureProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
