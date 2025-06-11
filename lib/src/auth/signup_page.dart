import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/components/gardient_loading_button.dart';
import 'package:lang_bridge/data/providers/auth_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/data/services/firebase/errors.dart';
import 'package:lang_bridge/src/auth/components/auth_shared_content.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return context.validator.required().build()(value);
    }
    if (value.length < 6) {
      return context.validator.required().minLength(6).build()(value);
    }
    if (confirmPasswordController.text.trim() != passwordController.text.trim()) {
      return context.l10n.validateIdenticalPasswords;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signup),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: context.colorScheme.onPrimary),
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
                WelcomeMessage(welcomeMessage: context.l10n.signupSubtitle),
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
                        FormHeader(
                          title: context.l10n.signup,
                          subtitle: context.l10n.signupSubtitle,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          context.l10n.fullName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextFormField(
                          controller: fullNameController,
                          hintText: context.l10n.fullNameHint,
                          labelText: context.l10n.fullNameHint,
                          validator: context.validator.required().build(),
                        ),
                        SizedBox(height: Insets.medium),
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
                          validator: _validateConfirmPassword,
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
                          controller: confirmPasswordController,
                          hintText: context.l10n.passwordHint,
                          label: context.l10n.passwordHint,
                          validator: _validateConfirmPassword,
                        ),
                        const SizedBox(height: 32),

                        // Sign Up Button
                        GradientLodingButton(
                          isLoading: ref.watch(signupProvider).isLoading,
                          label: context.l10n.signup,
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              final result = await ref.read(signupProvider.notifier).run(
                                    fullNameController.text.trim(),
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
                          prompt: context.l10n.loginPrompt,
                          action: context.l10n.login,
                          onTap: () => context.go(RoutesDocument.login),
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
