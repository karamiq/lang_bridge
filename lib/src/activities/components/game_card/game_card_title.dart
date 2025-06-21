part of 'game_card.dart';

class GameCardTitle extends StatelessWidget {
  const GameCardTitle({
    super.key,
    required this.title,
    required this.iconColor,
    required this.isPressed,
    required this.isLocked,
    required this.isEnabled,
  });

  final String title;
  final Color iconColor;
  final bool isPressed;
  final bool isLocked;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lockedColor = isDark ? const Color(0xFF8B5A2B) : const Color(0xFF6366F1);

    return Card(
        color: isLocked
            ? lockedColor
            : isEnabled
                ? iconColor
                : Colors.grey,
        child: Padding(
          padding: Insets.smallAll,
          child: Text(
            title,
            style: TextStyle(
              color: isLocked
                  ? Colors.white
                  : isEnabled
                      ? Colors.white
                      : Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
