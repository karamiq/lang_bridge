part of 'game_card.dart';

class GameCardActionButton extends ConsumerWidget {
  const GameCardActionButton({
    super.key,
    required this.iconColor,
    required this.isLocked,
    required this.isEnabled,
  });

  final Color iconColor;
  final bool isLocked;
  final bool isEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isArabic = ref.read(settingsProvider).locale.languageCode == 'ar';
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: isLocked
            ? LinearGradient(colors: [lockedColor, lockedSecondaryColor])
            : !isEnabled
                ? null
                : LinearGradient(colors: [
                    iconContainerColor,
                    iconContainerColor.withOpacity(0.8),
                  ]),
        color: !isEnabled && !isLocked ? colorScheme.onSurface.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(20),
        boxShadow: !isEnabled && !isLocked
            ? []
            : [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isLocked ? context.l10n.locked : context.l10n.play,
            style: TextStyle(
              color: isLocked
                  ? Colors.white
                  : !isEnabled
                      ? colorScheme.onSurface.withOpacity(0.6)
                      : colorScheme.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(Insets.extraSmall),
          Icon(
            isLocked
                ? Icons.lock_outline
                : isArabic
                    ? Icons.keyboard_arrow_left
                    : Icons.keyboard_arrow_right,
            color: isLocked
                ? Colors.white
                : !isEnabled
                    ? colorScheme.onSurface.withOpacity(0.6)
                    : colorScheme.onPrimary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
