import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/memory_card_model.dart';

class MemoryGameCard extends StatefulWidget {
  const MemoryGameCard({
    super.key,
    required this.card,
    required this.isFlipped,
    required this.isMatched,
    required this.onTap,
  });

  final GameCardModel card;
  final bool isFlipped;
  final bool isMatched;
  final VoidCallback onTap;

  @override
  State<MemoryGameCard> createState() => _MemoryGameCardState();
}

class _MemoryGameCardState extends State<MemoryGameCard> with TickerProviderStateMixin {
  late final AnimationController _flipController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final AnimationController _matchController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late final Animation<double> _flipAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
  );

  late final Animation<double> _matchAnimation = Tween(begin: 1.0, end: 1.2).animate(
    CurvedAnimation(parent: _matchController, curve: Curves.elasticOut),
  );

  @override
  void initState() {
    super.initState();
    if (widget.isFlipped) _flipController.value = 1.0;
  }

  @override
  void didUpdateWidget(MemoryGameCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    widget.isFlipped ? _flipController.forward() : _flipController.reverse();

    if (widget.isMatched && !oldWidget.isMatched) {
      _matchController.forward().then((_) => _matchController.reverse());
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    _matchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([_flipAnimation, _matchAnimation]),
        builder: (context, _) {
          final angle = _flipAnimation.value * pi;
          final showFront = angle > pi / 2;
          final scale = _matchAnimation.value;

          return Transform.scale(
            scale: scale,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: showFront
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: _CardFront(card: widget.card, matched: widget.isMatched),
                    )
                  : const _CardBack(),
            ),
          );
        },
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _cardContainer(
      context: context,
      color: colorScheme.primaryContainer.withOpacity(.4),
      border: Border.all(color: colorScheme.primary.withOpacity(.5), width: 2),
      child: Icon(
        Icons.question_mark,
        size: 40,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }
}

class _CardFront extends StatelessWidget {
  const _CardFront({required this.card, required this.matched});

  final GameCardModel card;
  final bool matched;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _cardContainer(
      context: context,
      color: matched ? colorScheme.tertiaryContainer : colorScheme.surface,
      border: Border.all(color: colorScheme.outline, width: 2),
      child: Text(
        card.text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: matched ? colorScheme.onTertiaryContainer : colorScheme.onSurface,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

Widget _cardContainer({
  required BuildContext context,
  required Widget child,
  Color? color,
  Border? border,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: color ?? colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      border: border,
      boxShadow: [
        BoxShadow(
          color: colorScheme.shadow.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Center(child: child),
  );
}
