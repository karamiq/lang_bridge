// =============================================================================
// CONTENT PROCESSING SERVICE
// =============================================================================

import 'package:lang_bridge/src/learn/pages/stories/pages/components/models.dart';

/// Service responsible for processing and splitting story content
class StoryContentProcessor {
  final StoryConfig config;

  StoryContentProcessor({required this.config});

  /// Main method to create aligned story parts from bilingual content
  List<StoryPart> createAlignedParts(String englishContent, String arabicContent) {
    if (englishContent.trim().isEmpty && arabicContent.trim().isEmpty) {
      return [];
    }

    // Step 1: Extract sentences from both languages
    final englishSentences = _extractSentences(englishContent);
    final arabicSentences = _extractSentences(arabicContent);

    // Step 2: Normalize sentence arrays to same length
    final alignedSentences = _alignSentenceArrays(englishSentences, arabicSentences);

    // Step 3: Group aligned sentences into parts
    return _groupSentencesIntoParts(alignedSentences.english, alignedSentences.arabic);
  }

  /// Extracts sentences from content using configured pattern
  List<String> _extractSentences(String content) {
    if (content.trim().isEmpty) return [];

    return content
        .split(config.sentenceSplitPattern)
        .map((sentence) => sentence.trim())
        .where((sentence) => sentence.isNotEmpty)
        .toList();
  }

  /// Ensures both language arrays have the same number of sentences
  AlignedSentences _alignSentenceArrays(List<String> english, List<String> arabic) {
    final maxLength = english.length > arabic.length ? english.length : arabic.length;

    // Pad shorter array with empty strings
    final alignedEnglish = List<String>.from(english);
    final alignedArabic = List<String>.from(arabic);

    while (alignedEnglish.length < maxLength) {
      alignedEnglish.add('');
    }
    while (alignedArabic.length < maxLength) {
      alignedArabic.add('');
    }

    return AlignedSentences(english: alignedEnglish, arabic: alignedArabic);
  }

  /// Groups aligned sentences into parts based on word count limits
  List<StoryPart> _groupSentencesIntoParts(List<String> englishSentences, List<String> arabicSentences) {
    final parts = <StoryPart>[];
    var currentEnglishSentences = <String>[];
    var currentArabicSentences = <String>[];
    var currentWordCount = 0;

    for (int i = 0; i < englishSentences.length; i++) {
      final englishSentence = englishSentences[i];
      final arabicSentence = arabicSentences[i];

      final sentenceWordCount = _calculateSentenceWordCount(englishSentence, arabicSentence);

      // Check if adding this sentence would exceed the limit
      if (_shouldCreateNewPart(currentWordCount, sentenceWordCount, currentEnglishSentences.isNotEmpty)) {
        // Create part from accumulated sentences
        parts.add(_createStoryPart(currentEnglishSentences, currentArabicSentences, parts.length + 1));

        // Start new part
        currentEnglishSentences = [englishSentence];
        currentArabicSentences = [arabicSentence];
        currentWordCount = sentenceWordCount;
      } else {
        // Add to current part
        currentEnglishSentences.add(englishSentence);
        currentArabicSentences.add(arabicSentence);
        currentWordCount += sentenceWordCount;
      }
    }

    // Add final part if it has content
    if (currentEnglishSentences.isNotEmpty) {
      parts.add(_createStoryPart(currentEnglishSentences, currentArabicSentences, parts.length + 1));
    }

    return parts.isEmpty ? [_createEmptyPart()] : parts;
  }

  int _calculateSentenceWordCount(String englishSentence, String arabicSentence) {
    final englishWords = englishSentence.trim().isEmpty ? 0 : englishSentence.trim().split(' ').length;
    final arabicWords = arabicSentence.trim().isEmpty ? 0 : arabicSentence.trim().split(' ').length;
    return englishWords + arabicWords;
  }

  bool _shouldCreateNewPart(int currentWordCount, int sentenceWordCount, bool hasContent) {
    return currentWordCount + sentenceWordCount > config.maxWordsPerPart && hasContent;
  }

  StoryPart _createStoryPart(List<String> englishSentences, List<String> arabicSentences, int partNumber) {
    return StoryPart(
      englishContent: englishSentences.where((s) => s.isNotEmpty).join(' ').trim(),
      arabicContent: arabicSentences.where((s) => s.isNotEmpty).join(' ').trim(),
      partNumber: partNumber,
    );
  }

  StoryPart _createEmptyPart() {
    return const StoryPart(
      englishContent: '',
      arabicContent: '',
      partNumber: 1,
    );
  }
}
