library;

import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
part 'game_card_action_button.dart';
part 'game_card_container.dart';
part 'game_card_content.dart';
part 'game_card_title.dart';
part 'game_card_icon.dart';

class GameCard extends StatefulWidget {
  const GameCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.isEnabled = true,
    this.isLocked = false,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  final bool isEnabled;
  final bool isLocked;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 4.0,
      end: 12.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handlePress(bool isPressed) {
    if (!_canInteract) return;

    setState(() => _isPressed = isPressed);
    if (isPressed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  bool get _canInteract => widget.isEnabled && !widget.isLocked;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GameCardContainer(
            elevation: _elevationAnimation.value,
            isPressed: _isPressed,
            isLocked: widget.isLocked,
            isEnabled: widget.isEnabled,
            iconColor: widget.iconColor,
            onTapDown: () => _handlePress(true),
            onTapUp: () => _handlePress(false),
            onTapCancel: () => _handlePress(false),
            onTap: _canInteract ? widget.onTap : null,
            child: GameCardContent(
              title: widget.title,
              icon: widget.icon,
              iconColor: widget.iconColor,
              isPressed: _isPressed,
              isLocked: widget.isLocked,
              isEnabled: widget.isEnabled,
            ),
          ),
        );
      },
    );
  }
}
