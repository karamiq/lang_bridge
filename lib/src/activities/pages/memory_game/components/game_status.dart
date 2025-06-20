import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';

class GameStatus extends StatelessWidget {
  const GameStatus({
    super.key,
    required this.gameState,
  });

  final MemeoryGameModel gameState;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: Insets.mediumAll,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard(l10n.moves, gameState.moves.toString()),
          _buildStatCard(l10n.matches, '${gameState.matches}/${gameState.cards.length ~/ 2}'),
          _buildStatCard(l10n.time, _formatTime(gameState.gameTime)),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(label,
                style: const TextStyle(
                  fontSize: 12,
                )),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
