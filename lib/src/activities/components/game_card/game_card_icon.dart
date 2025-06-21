part of 'game_card.dart';

class GameCardIcon extends StatelessWidget {
  const GameCardIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.isPressed,
    required this.isLocked,
    required this.isEnabled,
  });

  final IconData icon;
  final Color iconColor;
  final bool isPressed;
  final bool isLocked;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lockedColor = isDark ? const Color(0xFF8B5A2B) : const Color(0xFF6366F1);
    final lockedSecondaryColor = isDark ? const Color(0xFF6D4C41) : const Color(0xFF8B5CF6);

    final iconContainerColor = isLocked
        ? lockedColor
        : !isEnabled
            ? colorScheme.onSurface.withOpacity(0.3)
            : iconColor;

    final shadowColor = isLocked
        ? lockedColor.withOpacity(0.4)
        : isDark
            ? colorScheme.shadow.withOpacity(0.4)
            : iconColor.withOpacity(0.4);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isLocked
              ? [lockedColor, lockedSecondaryColor]
              : !isEnabled
                  ? [
                      colorScheme.onSurface.withOpacity(0.3),
                      colorScheme.onSurface.withOpacity(0.2),
                    ]
                  : [
                      iconContainerColor,
                      iconContainerColor.withOpacity(0.8),
                    ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: !isEnabled && !isLocked
            ? []
            : [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: isPressed ? 12 : 8,
                  offset: Offset(0, isPressed ? 6 : 4),
                ),
              ],
      ),
      child: AnimatedRotation(
        turns: isPressed ? 0.05 : 0,
        duration: const Duration(milliseconds: 250),
        child: Icon(
          isLocked ? Icons.lock : icon,
          color: isLocked
              ? Colors.white
              : !isEnabled
                  ? colorScheme.onSurface.withOpacity(0.6)
                  : colorScheme.onPrimary,
          size: 32,
        ),
      ),
    );
  }
}
