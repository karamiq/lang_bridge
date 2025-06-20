import 'package:flutter/material.dart';
import 'package:lang_bridge/components/streak_counter.dart';

class StreakDialog extends StatefulWidget {
  final int streakCount;

  const StreakDialog({
    super.key,
    required this.streakCount,
  });

  @override
  State<StreakDialog> createState() => _StreakDialogState();
}

class _StreakDialogState extends State<StreakDialog> {
  late int _streakCount;

  @override
  void initState() {
    super.initState();
    _streakCount = widget.streakCount;
    increseStreakCount();
  }

  void increseStreakCount() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _streakCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreakCounter(
      streakCount: _streakCount,
      primaryColor: Colors.orange,
      secondaryColor: Colors.deepOrange,
      size: 120,
    );
  }
}
