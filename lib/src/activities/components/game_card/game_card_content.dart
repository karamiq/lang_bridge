part of 'game_card.dart';

class GameCardContent extends StatelessWidget {
  const GameCardContent({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.isPressed,
    required this.isLocked,
    required this.isEnabled,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final bool isPressed;
  final bool isLocked;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.mediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GameCardIcon(
                icon: icon,
                iconColor: iconColor,
                isPressed: isPressed,
                isLocked: isLocked,
                isEnabled: isEnabled,
              ),
              const Gap(Insets.small),
              GameCardTitle(
                title: title,
                iconColor: iconColor,
                isPressed: isPressed,
                isLocked: isLocked,
                isEnabled: isEnabled,
              ),
              Spacer(),
              GameCardActionButton(
                iconColor: iconColor,
                isLocked: isLocked,
                isEnabled: isEnabled,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
