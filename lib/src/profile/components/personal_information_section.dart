// widgets/profile/personal_information_section.dart
import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/src/profile/components/profile_info_tile.dart';
import 'package:lang_bridge/src/profile/components/profile_section_card.dart';
import 'package:lang_bridge/common_lib.dart';

class PersonalInformationSection extends StatelessWidget {
  final AuthenticationModel profile;

  const PersonalInformationSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      title: 'Personal Information',
      children: [
        ProfileInfoTile(
          icon: Icons.person,
          title: context.l10n.fullName,
          subtitle: profile.fullName,
        ),
        ProfileInfoTile(
          icon: Icons.calendar_month,
          title: context.l10n.memberSince,
          subtitle: profile.createdAt.toLocal().toString().split(' ')[0],
        ),
        ProfileInfoTile(
          icon: Icons.email,
          title: context.l10n.emailLabel,
          subtitle: profile.email,
        ),
      ],
    );
  }
}
