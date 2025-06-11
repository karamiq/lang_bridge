import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/src/profile/components/profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  final AuthenticationModel profile;

  const ProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ProfileAvatar(profile: profile),
          const SizedBox(height: 15),
          Text(
            profile.fullName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
          ),
          Text(
            "${context.l10n.welcomeBack} !",
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onPrimary.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
