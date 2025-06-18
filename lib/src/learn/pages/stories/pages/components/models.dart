/// Represents a single part/page of a bilingual story
class StoryPart {
  final String englishContent;
  final String arabicContent;
  final int partNumber;

  const StoryPart({
    required this.englishContent,
    required this.arabicContent,
    required this.partNumber,
  });
}

/// Configuration for story content splitting
class StoryConfig {
  final int maxWordsPerPart;
  final bool preserveSentenceAlignment;
  final RegExp sentenceSplitPattern;

  StoryConfig({
    RegExp? sentenceSplitPattern,
    this.maxWordsPerPart = 120,
    this.preserveSentenceAlignment = true,
  }) : sentenceSplitPattern = sentenceSplitPattern ?? RegExp(r'(?<=[.!?])\s+');
}

/// Helper class to hold aligned sentences
class AlignedSentences {
  final List<String> english;
  final List<String> arabic;

  AlignedSentences({required this.english, required this.arabic});
}
