import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    this.icon,
    required this.color,
    this.label,
    this.onPressed,
  });

  final dynamic icon;
  final String? label;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderSize.extraSmallRadius,
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.1),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderSize.extraSmallRadius,
            border: Border.all(
              width: 1,
              color: onPressed != null ? color : color.withOpacity(0.5),
            ),
            color: colorScheme.surface.withOpacity(0.15),
          ),
          child: _buildIconContent(context),
        ),
      ),
    );
  }

  Widget _buildIconContent(BuildContext context) {
    final colorScheme = context.colorScheme;
    final iconColor = onPressed != null ? color : color.withOpacity(0.5);

    Widget iconWidget;

    // Handle different icon types
    if (icon is String) {
      iconWidget = SvgPicture.asset(
        icon as String,
        color: iconColor,
        width: 20,
        height: 20,
      );
    } else if (icon is IconData) {
      iconWidget = Icon(
        icon as IconData,
        color: iconColor,
        size: 20,
      );
    } else {
      iconWidget = const SizedBox.shrink();
    }

    if (label == null) {
      return iconWidget;
    }

    final textWidget = Text(
      label!,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: colorScheme.onPrimary,
      ),
    );

    if (icon == null) {
      return textWidget;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconWidget,
        const SizedBox(width: 6),
        textWidget,
      ],
    );
  }
}

// Optional: Add a separate widget for badge-style icons with notifications
class BadgeIcon extends StatelessWidget {
  const BadgeIcon({
    super.key,
    required this.icon,
    required this.color,
    this.badgeCount,
    this.onPressed,
  });

  final dynamic icon;
  final Color color;
  final int? badgeCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarIcon(
          icon: icon,
          color: color,
          onPressed: onPressed,
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                badgeCount! > 99 ? '99+' : badgeCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
