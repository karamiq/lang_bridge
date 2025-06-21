import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/listening_practice_models.dart';

// Improved Audio Player Card
class AudioPlayerCard extends HookWidget {
  final ListeningPracticeSentenceModel sentence;
  final String language;

  const AudioPlayerCard({
    super.key,
    required this.sentence,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    final isPlaying = useState(false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.headphones,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.listenAndType,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _playAudio(isPlaying),
              icon: Icon(isPlaying.value ? Icons.stop : Icons.play_arrow),
              label: Text(isPlaying.value ? context.l10n.playing : context.l10n.playAudio),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _playAudio(ValueNotifier<bool> isPlaying) async {
    // Implement audio playing logic here
    isPlaying.value = true;

    FlutterTts flutterTts = FlutterTts();

    if (language != 'ar') {
      await flutterTts.setLanguage('ar');
      flutterTts.setPitch(.2);
      flutterTts.setSpeechRate(0.3);
      await flutterTts.speak(sentence.arabic);
    } else {
      await flutterTts.setLanguage('en');
      flutterTts.setPitch(.2);
      flutterTts.setSpeechRate(0.3);
      await flutterTts.speak(sentence.english);

      flutterTts.setCompletionHandler(() {
        isPlaying.value = false;
      });

      // Simulate audio playback
      isPlaying.value = false;
    }
  }
}
