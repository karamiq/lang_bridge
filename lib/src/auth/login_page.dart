import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/components/gardient_loading_button.dart';
import 'package:lang_bridge/data/providers/auth_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/data/services/firebase/errors.dart';
import 'package:lang_bridge/src/auth/components/auth_shared_content.dart';
import 'package:lang_bridge/theme/theme_mode.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.login),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: settings.themeMode.isDark
                ? Icon(Icons.dark_mode, color: context.colorScheme.onPrimary)
                : Icon(Icons.light_mode, color: context.colorScheme.onPrimary),
            onPressed: () {
              ref.read(settingsProvider.notifier).toggleThemeMode(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.language, color: context.colorScheme.onPrimary),
            onPressed: () {
              ref.read(settingsProvider.notifier).toggleLocale();
            },
          )
        ],
      ),
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                BrandHeader(),
                const SizedBox(height: 16),
                WelcomeMessage(
                  welcomeMessage: context.l10n.welcomeBack,
                ),
                Container(
                  width: double.infinity,
                  padding: Insets.mediumAll,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.shadow.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormHeader(title: context.l10n.login, subtitle: context.l10n.formHeaderSubtitle),
                        const SizedBox(height: 20),
                        Text(
                          context.l10n.emailLabel,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: context.l10n.emailHint,
                          labelText: context.l10n.emailLabel,
                          validator: context.validator.email().build(),
                        ),
                        SizedBox(height: Insets.medium),
                        Text(
                          context.l10n.passwordLabel,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        PasswordFormField(
                            controller: passwordController,
                            hintText: context.l10n.passwordHint,
                            label: context.l10n.passwordLabel,
                            validator: context.validator.required().minLength(6).build()),
                        const SizedBox(height: 32),
                        GradientLodingButton(
                          isLoading: ref.watch(loginProvider).isLoading,
                          label: context.l10n.login,
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              final result = await ref.read(loginProvider.notifier).run(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                              result.when(
                                loading: () {},
                                error: (e, stackTrace) {
                                  final error = (e as FirebaseAuthException);
                                  Utils.showErrorSnackBar(getFirebaseAuthErrorMessage(
                                      error.code, settings.locale?.languageCode ?? 'en'));
                                },
                                data: (value) {
                                  context.go(RoutesDocument.landing);
                                },
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                        ActionLink(
                          prompt: context.l10n.signupPrompt,
                          action: context.l10n.signup,
                          onTap: () => context.go(RoutesDocument.signup),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SecurityMessage(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
