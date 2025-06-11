import 'package:flutter/material.dart';

class UpperNavigationBarButton {
  const UpperNavigationBarButton({
    required this.label,
    required this.icon,
    this.inactiveIcon,
  });

  final String label;
  final IconData icon;
  final IconData? inactiveIcon;
}
