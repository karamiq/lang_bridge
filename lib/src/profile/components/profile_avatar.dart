// widgets/profile/profile_avatar.dart
import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/src/profile/components/uid_to_color.dart';

class ProfileAvatar extends StatelessWidget {
  final AuthenticationModel profile;
  final double radius;

  const ProfileAvatar({
    super.key,
    required this.profile,
    this.radius = 60,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.onPrimary,
      child: CircleAvatar(
        radius: radius - 5,
        backgroundColor: ColorUtils.uidToColor(profile.uid),
        child: Text(
          profile.fullName.isNotEmpty ? profile.fullName[0] : '',
          style: TextStyle(
            fontSize: radius * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
