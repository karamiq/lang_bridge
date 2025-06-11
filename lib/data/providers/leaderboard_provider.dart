import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import '../services/clients/_clients.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderboardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream of top 20 users ordered by points
  Stream<List<AuthenticationModel>> getTopUsersStream() {
    return _firestore
        .collection('users')
        .orderBy('points', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AuthenticationModel.fromJson({
                  ...doc.data(),
                  'uid': doc.id,
                }))
            .toList());
  }

  // Get user rank by points
  Future<int> getUserRank(String uid) async {
    final userDoc = await _firestore.collection('users').doc(uid).get();
    if (!userDoc.exists) return 0;

    final userData = AuthenticationModel.fromJson({
      ...userDoc.data()!,
      'uid': userDoc.id,
    });

    final higherRankedCount =
        await _firestore.collection('users').where('points', isGreaterThan: userData.points).count().get();

    return higherRankedCount.count! + 1;
  }

  // Get specific user data
  Stream<AuthenticationModel?> getUserStream(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return AuthenticationModel.fromJson({
        ...doc.data()!,
        'uid': doc.id,
      });
    });
  }
}

// Providers
final leaderboardRepositoryProvider = Provider<LeaderboardRepository>((ref) {
  return LeaderboardRepository();
});

final topUsersStreamProvider = StreamProvider<List<AuthenticationModel>>((ref) {
  final repository = ref.watch(leaderboardRepositoryProvider);
  return repository.getTopUsersStream();
});

final currentUserProvider = StreamProvider.family<AuthenticationModel?, String>((ref, uid) {
  final repository = ref.watch(leaderboardRepositoryProvider);
  return repository.getUserStream(uid);
});

final userRankProvider = FutureProvider.family<int, String>((ref, uid) {
  final repository = ref.watch(leaderboardRepositoryProvider);
  return repository.getUserRank(uid);
});

///////////////////////////////////////////////////////////

class UserRankCache {
  int? _cachedRank;
  String? _cachedUserId;
  DateTime? _lastUpdated;
  static const Duration _cacheExpiry = Duration(minutes: 5);

  bool get isExpired {
    if (_lastUpdated == null) return true;
    return DateTime.now().difference(_lastUpdated!) > _cacheExpiry;
  }

  int? getCachedRank(String userId) {
    if (_cachedUserId != userId || isExpired) {
      return null;
    }
    return _cachedRank;
  }

  void setCachedRank(String userId, int rank) {
    _cachedUserId = userId;
    _cachedRank = rank;
    _lastUpdated = DateTime.now();
  }

  void clearCache() {
    _cachedRank = null;
    _cachedUserId = null;
    _lastUpdated = null;
  }
}

// Provider for the cache
final userRankCacheProvider = Provider<UserRankCache>((ref) {
  return UserRankCache();
});

// Enhanced rank provider with caching
final cachedUserRankProvider = FutureProvider.family<int, String>((ref, uid) async {
  final cache = ref.read(userRankCacheProvider);
  final repository = ref.read(leaderboardRepositoryProvider);

  // Check cache first
  final cachedRank = cache.getCachedRank(uid);
  if (cachedRank != null) {
    return cachedRank;
  }

  // Fetch from repository and cache
  final rank = await repository.getUserRank(uid);
  cache.setCachedRank(uid, rank);

  return rank;
});
