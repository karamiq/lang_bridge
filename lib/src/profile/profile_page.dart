import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/src/profile/components/dialogs.dart';
import 'package:lang_bridge/src/profile/components/personal_information_section.dart';
import 'package:lang_bridge/src/profile/components/profile_action_tile.dart';
import 'package:lang_bridge/src/profile/components/profile_header.dart';
import 'package:lang_bridge/src/profile/components/profile_section_card.dart';
import 'package:lang_bridge/src/profile/components/profile_setting_tile.dart';
import 'package:lang_bridge/src/profile/components/profile_stats_card.dart';
import 'package:lang_bridge/theme/theme_mode.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.colorScheme;
    final settings = ref.watch(settingsProvider);
    final profile = ref.watch(authenticationProvider);

    Widget buildAccountSettingsSection(
      BuildContext context,
      WidgetRef ref,
    ) {
      return ProfileSectionCard(
        title: context.l10n.accountSettings,
        children: [
          ProfileSettingTile(
            icon: Icons.dark_mode,
            title: context.l10n.darkMode,
            subtitle: context.l10n.themeDark,
            trailing: Switch(
              value: settings.themeMode.isDark,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).toggleThemeMode(context);
              },
            ),
          ),
          ProfileActionTile(
            icon: Icons.language,
            title: context.l10n.changeLanguage,
            subtitle: settings.locale!.languageCode.toUpperCase(),
            onTap: () => _showLanguageDialog(context),
          ),
        ],
      );
    }

    if (profile == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(profile: profile),
            const SizedBox(height: 20),
            ProfileStatsCard(profile: profile),
            const SizedBox(height: 20),
            PersonalInformationSection(profile: profile),
            buildAccountSettingsSection(context, ref),
            _buildSupportSection(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ProfileSectionCard(
      title: context.l10n.supportAndOthers,
      children: [
        ProfileActionTile(
          icon: Icons.help,
          title: context.l10n.helpAndSupport,
          subtitle: context.l10n.getHelpAndSupport,
          onTap: () => _showHelpSnackbar(context),
        ),
        ProfileActionTile(
          icon: Icons.info,
          title: context.l10n.about,
          subtitle: context.l10n.appVersionInfo,
          onTap: () => _showAboutDialog(context),
        ),
        ProfileActionTile(
          icon: Icons.logout,
          title: context.l10n.logout,
          subtitle: context.l10n.signOut,
          textColor: colorScheme.error,
          onTap: () => _showLogoutDialog(context),
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LanguageDialog(),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AboutAppDialog(),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LogoutDialog(),
    );
  }

  void _showHelpSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.helpAndSupportPressed)),
    );
  }
}
