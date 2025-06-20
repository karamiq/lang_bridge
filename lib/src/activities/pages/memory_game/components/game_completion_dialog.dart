import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';
import 'package:lang_bridge/utils/extensions.dart';

class GameCompletionDialog extends StatelessWidget {
  const GameCompletionDialog({
    super.key,
    required this.gameState,
    required this.onPlayAgain,
    required this.onFinish,
  });

  final MemeoryGameModel gameState;
  final VoidCallback onPlayAgain;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.congratulations),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.l10n.gameCompletedMoves(gameState.moves.toString())),
          Text(context.l10n.timeLabel(_formatTime(gameState.gameTime))),
          Text(
            context.l10n.totalPoints(gameState.points.toString()),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPlayAgain,
          child: Text(context.l10n.playAgain),
        ),
        TextButton(
          onPressed: onFinish,
          child: Text(context.l10n.finish),
        ),
      ],
    );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
