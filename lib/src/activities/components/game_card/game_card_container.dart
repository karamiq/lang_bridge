part of 'game_card.dart';

class GameCardContainer extends StatelessWidget {
  const GameCardContainer({
    super.key,
    required this.elevation,
    required this.isPressed,
    required this.isLocked,
    required this.isEnabled,
    required this.iconColor,
    required this.onTapDown,
    required this.onTapUp,
    required this.onTapCancel,
    required this.onTap,
    required this.child,
  });

  final double elevation;
  final bool isPressed;
  final bool isLocked;
  final bool isEnabled;
  final Color iconColor;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;
  final VoidCallback onTapCancel;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Consistent base colors for all states
    final lockedColor = isDark ? const Color(0xFF8B5A2B) : const Color(0xFF6366F1);
    final disabledColor = colorScheme.outline;
    final activeColor = iconColor;

    // Determine the primary color based on state
    final Color primaryColor = isLocked
        ? lockedColor
        : !isEnabled
            ? disabledColor
            : activeColor;

    // Opacity values optimized for text clarity
    final double backgroundOpacity = isDark ? 0.08 : 0.04;
    final double borderOpacityNormal = isDark ? 0.4 : 0.5;
    final double borderOpacityPressed = isDark ? 0.6 : 0.7;
    final double shadowOpacity = isDark ? 0.3 : 0.4;

    // Consistent border widths
    const double borderWidthNormal = 1.5;
    const double borderWidthPressed = 2.0;

    return Material(
      elevation: elevation,
      borderRadius: BorderSize.smallRadius,
      shadowColor: primaryColor.withOpacity(shadowOpacity),
      color: Colors.transparent,
      child: GestureDetector(
        onTapDown: (_) => onTapDown(),
        onTapUp: (_) => onTapUp(),
        onTapCancel: onTapCancel,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(backgroundOpacity),
            borderRadius: BorderSize.smallRadius,
            border: Border.all(
              color: primaryColor.withOpacity(
                isPressed ? borderOpacityPressed : borderOpacityNormal,
              ),
              width: isPressed ? borderWidthPressed : borderWidthNormal,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
