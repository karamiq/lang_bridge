import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/landing/components/language_selection_card.dart';
import 'package:lang_bridge/src/landing/components/language_selection_header_and_footer.dart';

import '../../../data/providers/settings_provider.dart';

class LanguageSelectionPage extends ConsumerStatefulWidget {
  const LanguageSelectionPage({
    super.key,
  });

  @override
  createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends ConsumerState<LanguageSelectionPage> {
  String? _pressedLanguage;
  String? _selectedLanguage;

  void _handleLanguageSelection(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    HapticFeedback.selectionClick();
  }

  void _handleContinue() {
    if (_selectedLanguage != null) {
      HapticFeedback.selectionClick();
      ref.read(settingsProvider.notifier).setLocale(Locale(_selectedLanguage!));
      context.push(RoutesDocument.landing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header section
                const Expanded(
                  flex: 2,
                  child: LanguageSelectionHeader(),
                ),

                Expanded(
                  flex: 3,
                  child: LanguageSelectionCards(
                    pressedLanguage: _pressedLanguage,
                    selectedLanguage: _selectedLanguage,
                    onLanguagePressed: (language) {
                      setState(() {
                        _pressedLanguage = language;
                      });
                    },
                    onLanguageReleased: () {
                      setState(() {
                        _pressedLanguage = null;
                      });
                    },
                    onLanguageSelected: _handleLanguageSelection,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: _selectedLanguage != null ? 1.0 : 0.5,
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: Matrix4.identity()..scale(_selectedLanguage != null ? 1.0 : 0.95),
                          child: ElevatedButton(
                            onPressed: _selectedLanguage != null ? _handleContinue : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primary,
                              disabledBackgroundColor: Colors.white.withOpacity(0.7),
                              disabledForegroundColor: AppColors.primary.withOpacity(0.5),
                              elevation: _selectedLanguage != null ? 8 : 4,
                              shadowColor: AppColors.primary.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: _selectedLanguage != null
                                      ? AppColors.accent.withOpacity(0.3)
                                      : Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_selectedLanguage == 'ar') ...[
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: _selectedLanguage != null
                                        ? AppColors.primary
                                        : AppColors.primary.withOpacity(0.5),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                Text(
                                  _selectedLanguage == 'ar' ? 'متابعة' : 'Continue',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: _selectedLanguage != null
                                        ? AppColors.primary
                                        : AppColors.primary.withOpacity(0.5),
                                  ),
                                ),
                                if (_selectedLanguage != 'ar' && _selectedLanguage != null) ...[
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const LanguageSelectionFooter(),
                    ],
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
