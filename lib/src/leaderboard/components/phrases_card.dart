import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lang_bridge/common_lib.dart';

class PhraseCard extends StatefulWidget {
  final String english;
  final String arabic;
  final String arabicPronunciation;
  final String englishPronunciation;

  const PhraseCard({
    super.key,
    required this.english,
    required this.arabic,
    required this.arabicPronunciation,
    required this.englishPronunciation,
  });

  @override
  State<PhraseCard> createState() => _PhraseCardState();
}

class _PhraseCardState extends State<PhraseCard> {
  late FlutterTts flutterTts;
  bool isPlayingEnglish = false;
  bool isPlayingArabic = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initTts();
  }

  _initTts() async {
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlayingEnglish = false;
        isPlayingArabic = false;
      });
    });
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _speakEnglish() async {
    if (isPlayingEnglish) return;

    setState(() {
      isPlayingEnglish = true;
      isPlayingArabic = false;
    });

    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(widget.english);
  }

  Future<void> _speakArabic() async {
    if (isPlayingArabic) return;

    setState(() {
      isPlayingArabic = true;
      isPlayingEnglish = false;
    });

    await flutterTts.setLanguage("ar-SA");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(widget.arabic);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.small),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDarkMode
              ? [colorScheme.surface, colorScheme.surface.withOpacity(0.8)]
              : [Colors.white, colorScheme.surface.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderSize.extraSmallRadius,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // English Section
            _buildLanguageSection(
              language: widget.english,
              pronunciation: widget.englishPronunciation,
              onPlay: _speakEnglish,
              color: colorScheme.primary,
              fontSize: 20,
              fontFamily: null,
              textAlign: TextAlign.left,
              icon: Icons.record_voice_over_rounded,
            ),

            const Gap(Insets.small),
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.outline.withOpacity(.9),
                    colorScheme.outline,
                    colorScheme.outline.withOpacity(.9),
                  ],
                ),
              ),
            ),
            // Arabic Section
            _buildLanguageSection(
              language: widget.arabic,
              pronunciation: widget.arabicPronunciation,
              onPlay: _speakArabic,
              color: colorScheme.secondary,
              fontSize: 28,
              fontFamily: 'thuluth',
              textAlign: TextAlign.right,
              icon: Icons.volume_up_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSection({
    required String language,
    required String pronunciation,
    required VoidCallback onPlay,
    required Color color,
    required double fontSize,
    required String? fontFamily,
    required TextAlign textAlign,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.right ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language,
                    textAlign: textAlign,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.bold,
                      color: color,
                      height: 1.2,
                    ),
                  ),
                  const Gap(Insets.small),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: color.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      pronunciation,
                      textAlign: textAlign,
                      style: TextStyle(
                        fontSize: 14,
                        color: color.withOpacity(0.8),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: onPlay,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
