import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/utils/snackbar.dart';

class UserListenerService {
  final WidgetRef ref;

  UserListenerService(this.ref);

  void listenToUserDoc(String uid) {
    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
    docRef.snapshots().listen((docSnapshot) async {
      if (!docSnapshot.exists) return;

      final data = docSnapshot.data();
      if (data == null) return;

      final currentAuth = ref.read(authenticationProvider);
      if (currentAuth != null) {
        ref.read(authenticationProvider.notifier).update(
              (state) => state!.copyWith(
                points: data['points'] ?? currentAuth.points,
                streak: data['streak'] ?? currentAuth.streak,
              ),
            );
      }
    });
  }

  Future<void> checkAndUpdateStreak(String uid) async {
    await StreakUpdater(ref).checkAndUpdateStreak(uid);
  }
}

class StreakUpdater {
  final WidgetRef ref;

  StreakUpdater(this.ref);

  DateTime _currentDay() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  Future<void> checkAndUpdateStreak(String uid) async {
    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final snapshot = await docRef.get();

    if (!snapshot.exists) return;

    final data = snapshot.data();
    if (data == null) return;

    final lastOpened = (data['lastOpenedDate'] as Timestamp?)?.toDate() ?? DateTime(2000);
    int previousStreak = data['streak'] ?? 0;
    int currentStreak = previousStreak;

    final today = _currentDay();
    final yesterday = today.subtract(const Duration(days: 1));
    final lastDay = DateTime(lastOpened.year, lastOpened.month, lastOpened.day);

    if (lastDay.isAtSameMomentAs(today)) return;

    if (lastDay.isAtSameMomentAs(yesterday)) {
      currentStreak += 1;
    } else {
      currentStreak = 1;
    }

    await docRef.update({
      'lastOpenedDate': today,
      'streak': currentStreak,
    });

    final currentAuth = ref.read(authenticationProvider);
    if (currentAuth != null) {
      ref.read(authenticationProvider.notifier).update(
            (state) => state!.copyWith(streak: currentStreak),
          );
    }

    if (currentStreak > previousStreak) {
      StreakFeedback.showStreakSnackbar(currentStreak);
    }
  }
}

class StreakFeedback {
  static void showStreakSnackbar(int streak) {
    Utils.showSuccessSnackBar(
      "🔥 Great job! You've kept your $streak-day streak alive!",
    );
  }

  static void showStreakDialog(BuildContext context, int streak) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("🔥 Streak Maintained!"),
        content: Text("You've kept a $streak-day streak alive!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Keep Going"),
          ),
        ],
      ),
    );
  }
}
