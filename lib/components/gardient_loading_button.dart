import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class GradientLodingButton extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;

  const GradientLodingButton({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color overlayColor = Colors.black.withOpacity(0.2);
    return AbsorbPointer(
      absorbing: isLoading || !isEnabled,
      child: Opacity(
        opacity: isEnabled ? 1 : 0.5,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: isLoading || !isEnabled ? overlayColor : null,
            gradient: LinearGradient(
              colors: [
                context.colorScheme.primary,
                context.colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            onPressed: !isEnabled
                ? null
                : isLoading
                    ? null
                    : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: isLoading
                ? const SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon!,
                        const SizedBox(width: 8),
                      ],
                      Text(
                        label ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
