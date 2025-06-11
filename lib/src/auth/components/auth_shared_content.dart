import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.primary,
                context.colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.computer,
            color: context.colorScheme.onPrimary,
            size: 32,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          context.l10n.appName,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key, required this.welcomeMessage});
  final String welcomeMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      welcomeMessage,
      style: TextStyle(
        fontSize: 18,
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class FormHeader extends StatelessWidget {
  const FormHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class ActionLink extends StatelessWidget {
  final VoidCallback onTap;

  const ActionLink({super.key, required this.onTap, required this.prompt, required this.action});
  final String prompt;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.signupPrompt,
          style: TextStyle(
            fontSize: 16,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: TextStyle(
              fontSize: 16,
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class SecurityMessage extends StatelessWidget {
  const SecurityMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.lock,
          color: context.colorScheme.onSurfaceVariant,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          context.l10n.securityMessage,
          style: TextStyle(
            fontSize: 14,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
