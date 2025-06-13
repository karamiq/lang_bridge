// =====================================
// 1. MODELS & ENUMS
// =====================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/category_model.dart';

import '../../../../common_lib.dart';

enum MatchState {
  unselected,
  selected,
  matched,
  wrongMatch,
}

class GameWord {
  final String id;
  final String text;
  final MatchState state;
  final bool isRtl;

  const GameWord({
    required this.id,
    required this.text,
    required this.state,
    required this.isRtl,
  });

  GameWord copyWith({
    String? id,
    String? text,
    MatchState? state,
    bool? isRtl,
  }) {
    return GameWord(
      id: id ?? this.id,
      text: text ?? this.text,
      state: state ?? this.state,
      isRtl: isRtl ?? this.isRtl,
    );
  }
}

class GameState {
  final List<GameWord> englishWords;
  final List<GameWord> arabicWords;
  final Map<String, String> correctMatches;
  final String? selectedEnglishId;
  final String? selectedArabicId;
  final int score;
  final int attempts;
  final bool isGameComplete;

  const GameState({
    required this.englishWords,
    required this.arabicWords,
    required this.correctMatches,
    this.selectedEnglishId,
    this.selectedArabicId,
    required this.score,
    required this.attempts,
    required this.isGameComplete,
  });

  GameState copyWith({
    List<GameWord>? englishWords,
    List<GameWord>? arabicWords,
    Map<String, String>? correctMatches,
    String? selectedEnglishId,
    String? selectedArabicId,
    int? score,
    int? attempts,
    bool? isGameComplete,
    bool clearSelectedEnglish = false,
    bool clearSelectedArabic = false,
  }) {
    return GameState(
      englishWords: englishWords ?? this.englishWords,
      arabicWords: arabicWords ?? this.arabicWords,
      correctMatches: correctMatches ?? this.correctMatches,
      selectedEnglishId: clearSelectedEnglish ? null : (selectedEnglishId ?? this.selectedEnglishId),
      selectedArabicId: clearSelectedArabic ? null : (selectedArabicId ?? this.selectedArabicId),
      score: score ?? this.score,
      attempts: attempts ?? this.attempts,
      isGameComplete: isGameComplete ?? this.isGameComplete,
    );
  }
}

// =====================================
// 2. DATA LAYER - FIRESTORE SERVICE
// =======================
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

abstract class VocabularyDataSource {
  Future<List<CategorynModel>> getVocabularyByCategory(CategoryEnum category);
}

class FirestoreVocabularyDataSource implements VocabularyDataSource {
  final FirebaseFirestore _firestore;

  FirestoreVocabularyDataSource(this._firestore);

  @override
  Future<List<CategorynModel>> getVocabularyByCategory(CategoryEnum category) async {
    try {
      final querySnapshot =
          await _firestore.collection('categories').where('category', isEqualTo: category.toJson()).get();

      return querySnapshot.docs
          .map((doc) => CategorynModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch vocabulary: $e');
    }
  }
}

final vocabularyDataSourceProvider = Provider<VocabularyDataSource>((ref) {
  final firestore = ref.read(firestoreProvider);
  return FirestoreVocabularyDataSource(firestore);
});

// =====================================
// 3. REPOSITORY LAYER
// =====================================

abstract class VocabularyRepository {
  Future<List<CategorynModel>> getRandomVocabulary(CategoryEnum category, int count);
}

class VocabularyRepositoryImpl implements VocabularyRepository {
  final VocabularyDataSource _dataSource;

  VocabularyRepositoryImpl(this._dataSource);

  @override
  Future<List<CategorynModel>> getRandomVocabulary(CategoryEnum category, int count) async {
    final allVocabulary = await _dataSource.getVocabularyByCategory(category);

    if (allVocabulary.length <= count) {
      return allVocabulary;
    }

    final shuffled = List<CategorynModel>.from(allVocabulary)..shuffle();
    return shuffled.take(count).toList();
  }
}

final vocabularyRepositoryProvider = Provider<VocabularyRepository>((ref) {
  final dataSource = ref.read(vocabularyDataSourceProvider);
  return VocabularyRepositoryImpl(dataSource);
});

final randomVocabularyProvider =
    FutureProvider.family<List<CategorynModel>, CategoryEnum>((ref, category) async {
  final repository = ref.read(vocabularyRepositoryProvider);
  return repository.getRandomVocabulary(category, 6);
});

// =====================================
// 4. BUSINESS LOGIC - GAME SERVICE
// =====================================

class GameService {
  static GameState initializeGame(List<CategorynModel> vocabulary) {
    final englishWords = vocabulary
        .map((v) => GameWord(
              id: v.id,
              text: v.english,
              state: MatchState.unselected,
              isRtl: false,
            ))
        .toList();

    final arabicWords = vocabulary
        .map((v) => GameWord(
              id: v.id,
              text: v.arabic,
              state: MatchState.unselected,
              isRtl: true,
            ))
        .toList()
      ..shuffle();

    final correctMatches = <String, String>{};
    for (var item in vocabulary) {
      correctMatches[item.id] = item.id;
    }

    return GameState(
      englishWords: englishWords,
      arabicWords: arabicWords,
      correctMatches: correctMatches,
      score: 0,
      attempts: 0,
      isGameComplete: false,
    );
  }

  static GameState processSelection({
    required GameState currentState,
    String? englishId,
    String? arabicId,
  }) {
    // Update selection state
    var newState = currentState.copyWith(
      selectedEnglishId: englishId,
      selectedArabicId: arabicId,
    );

    // Update word states based on selection
    newState = _updateWordStates(newState);

    return newState;
  }

  static GameState checkMatch(GameState currentState) {
    if (currentState.selectedEnglishId == null || currentState.selectedArabicId == null) {
      return currentState;
    }

    final englishId = currentState.selectedEnglishId!;
    final arabicId = currentState.selectedArabicId!;
    final newAttempts = currentState.attempts + 1;
    final isCorrect = currentState.correctMatches[englishId] == arabicId;

    if (isCorrect) {
      return _handleCorrectMatch(currentState, englishId, arabicId, newAttempts);
    } else {
      return _handleWrongMatch(currentState, englishId, arabicId, newAttempts);
    }
  }

  static GameState clearWrongMatchStates(GameState currentState) {
    final updatedEnglishWords = currentState.englishWords.map((word) {
      if (word.state == MatchState.wrongMatch) {
        return word.copyWith(state: MatchState.unselected);
      }
      return word;
    }).toList();

    final updatedArabicWords = currentState.arabicWords.map((word) {
      if (word.state == MatchState.wrongMatch) {
        return word.copyWith(state: MatchState.unselected);
      }
      return word;
    }).toList();

    return currentState.copyWith(
      englishWords: updatedEnglishWords,
      arabicWords: updatedArabicWords,
      clearSelectedEnglish: true,
      clearSelectedArabic: true,
    );
  }

  static GameState _updateWordStates(GameState state) {
    final updatedEnglishWords = state.englishWords.map((word) {
      if (word.state == MatchState.matched) return word;

      final newState = word.id == state.selectedEnglishId ? MatchState.selected : MatchState.unselected;
      return word.copyWith(state: newState);
    }).toList();

    final updatedArabicWords = state.arabicWords.map((word) {
      if (word.state == MatchState.matched) return word;

      final newState = word.id == state.selectedArabicId ? MatchState.selected : MatchState.unselected;
      return word.copyWith(state: newState);
    }).toList();

    return state.copyWith(
      englishWords: updatedEnglishWords,
      arabicWords: updatedArabicWords,
    );
  }

  static GameState _handleCorrectMatch(GameState state, String englishId, String arabicId, int attempts) {
    final updatedEnglishWords = state.englishWords.map((word) {
      if (word.id == englishId) {
        return word.copyWith(state: MatchState.matched);
      }
      return word;
    }).toList();

    final updatedArabicWords = state.arabicWords.map((word) {
      if (word.id == arabicId) {
        return word.copyWith(state: MatchState.matched);
      }
      return word;
    }).toList();

    final newScore = state.score + 10;
    final matchedCount = updatedEnglishWords.where((w) => w.state == MatchState.matched).length;
    final isComplete = matchedCount == state.englishWords.length;

    return state.copyWith(
      englishWords: updatedEnglishWords,
      arabicWords: updatedArabicWords,
      score: newScore,
      attempts: attempts,
      isGameComplete: isComplete,
      clearSelectedEnglish: true,
      clearSelectedArabic: true,
    );
  }

  static GameState _handleWrongMatch(GameState state, String englishId, String arabicId, int attempts) {
    final updatedEnglishWords = state.englishWords.map((word) {
      if (word.id == englishId) {
        return word.copyWith(state: MatchState.wrongMatch);
      }
      return word;
    }).toList();

    final updatedArabicWords = state.arabicWords.map((word) {
      if (word.id == arabicId) {
        return word.copyWith(state: MatchState.wrongMatch);
      }
      return word;
    }).toList();

    return state.copyWith(
      englishWords: updatedEnglishWords,
      arabicWords: updatedArabicWords,
      attempts: attempts,
    );
  }
}

// =====================================
// 5. STATE MANAGEMENT - GAME NOTIFIER
// =====================================

class GameNotifier extends StateNotifier<GameState?> {
  GameNotifier() : super(null);

  void initializeGame(List<CategorynModel> vocabulary) {
    state = GameService.initializeGame(vocabulary);
  }

  void selectEnglishWord(String wordId) {
    if (state == null) return;

    final currentState = state!;
    final newState = GameService.processSelection(
      currentState: currentState,
      englishId: wordId,
      arabicId: currentState.selectedArabicId,
    );

    state = newState;
    _checkForMatch();
  }

  void selectArabicWord(String wordId) {
    if (state == null) return;

    final currentState = state!;
    final newState = GameService.processSelection(
      currentState: currentState,
      englishId: currentState.selectedEnglishId,
      arabicId: wordId,
    );

    state = newState;
    _checkForMatch();
  }

  void _checkForMatch() {
    if (state?.selectedEnglishId == null || state?.selectedArabicId == null) return;

    final newState = GameService.checkMatch(state!);
    state = newState;

    // If it was a wrong match, clear the red state after 1 second
    if (newState.englishWords.any((w) => w.state == MatchState.wrongMatch)) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          state = GameService.clearWrongMatchStates(state!);
        }
      });
    }
  }

  void resetGame() {
    if (state?.englishWords != null) {
      // Reconstruct vocabulary from current game state
      final vocabulary = state!.englishWords.map((englishWord) {
        final arabicWord = state!.arabicWords.firstWhere((w) => w.id == englishWord.id);
        return CategorynModel(
          id: englishWord.id,
          english: englishWord.text,
          arabic: arabicWord.text,
          arabicPronunciation: '',
          englishPronunciation: '',
          category: CategoryEnum.animals, // This will be overridden
        );
      }).toList();

      initializeGame(vocabulary);
    }
  }
}

final gameProvider = StateNotifierProvider<GameNotifier, GameState?>((ref) {
  return GameNotifier();
});

// =====================================
// 6. UI COMPONENTS
// =====================================

// Word Card Component
class WordCard extends StatelessWidget {
  final GameWord word;
  final VoidCallback? onTap;

  const WordCard({
    super.key,
    required this.word,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getCardColors(word.state);

    return GestureDetector(
      onTap: word.state == MatchState.matched ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.borderColor, width: 2),
          boxShadow: word.state == MatchState.selected
              ? [
                  BoxShadow(
                    color: colors.borderColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            if (word.state == MatchState.matched)
              Icon(
                Icons.check_circle,
                color: Colors.green[600],
                size: 20,
              ),
            if (word.state == MatchState.matched) const SizedBox(width: 8),
            Expanded(
              child: Text(
                word.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colors.textColor,
                ),
                textAlign: word.isRtl ? TextAlign.right : TextAlign.left,
                textDirection: word.isRtl ? TextDirection.rtl : TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _CardColors _getCardColors(MatchState state) {
    switch (state) {
      case MatchState.matched:
        return _CardColors(
          backgroundColor: Colors.green[100]!,
          borderColor: Colors.green[400]!,
          textColor: Colors.green[800]!,
        );
      case MatchState.selected:
        return _CardColors(
          backgroundColor: Colors.blue[100]!,
          borderColor: Colors.blue[400]!,
          textColor: Colors.blue[800]!,
        );
      case MatchState.wrongMatch:
        return _CardColors(
          backgroundColor: Colors.red[100]!,
          borderColor: Colors.red[400]!,
          textColor: Colors.red[800]!,
        );
      case MatchState.unselected:
      default:
        return _CardColors(
          backgroundColor: Colors.white,
          borderColor: Colors.grey[300]!,
          textColor: Colors.black87,
        );
    }
  }
}

class _CardColors {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  _CardColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  });
}

// Game Stats Component
class GameStats extends StatelessWidget {
  final int score;
  final int attempts;

  const GameStats({
    super.key,
    required this.score,
    required this.attempts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Score: $score',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            'Attempts: $attempts',
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

// Game Complete Component
class GameCompleteScreen extends StatelessWidget {
  final GameState gameState;
  final VoidCallback onPlayAgain;
  final VoidCallback onGoHome;

  const GameCompleteScreen({
    super.key,
    required this.gameState,
    required this.onPlayAgain,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    final accuracy =
        gameState.attempts > 0 ? (gameState.score / (gameState.attempts * 10) * 100).round() : 100;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.emoji_events,
              size: 80,
              color: Colors.amber,
            ),
            const SizedBox(height: 16),
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You completed the game!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildStatRow('Final Score', '${gameState.score}'),
                  const SizedBox(height: 8),
                  _buildStatRow('Total Attempts', '${gameState.attempts}'),
                  const SizedBox(height: 8),
                  _buildStatRow('Accuracy', '$accuracy%'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: onPlayAgain,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Play Again'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: onGoHome,
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// =====================================
// 7. MAIN GAME SCREEN
// =====================================

class VocabularyMatchingGame extends ConsumerStatefulWidget {
  final CategoryEnum category;

  const VocabularyMatchingGame({
    super.key,
    required this.category,
  });

  @override
  ConsumerState<VocabularyMatchingGame> createState() => _VocabularyMatchingGameState();
}

class _VocabularyMatchingGameState extends ConsumerState<VocabularyMatchingGame> {
  @override
  Widget build(BuildContext context) {
    final vocabularyAsync = ref.watch(randomVocabularyProvider(widget.category));
    final gameState = ref.watch(gameProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          '🎯 Vocabulary Matching',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: gameState != null ? [GameStats(score: gameState.score, attempts: gameState.attempts)] : null,
      ),
      body: vocabularyAsync.when(
        data: (vocabulary) {
          if (gameState == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(gameProvider.notifier).initializeGame(vocabulary);
            });
            return const Center(child: CircularProgressIndicator());
          }

          if (gameState.isGameComplete) {
            return GameCompleteScreen(
              gameState: gameState,
              onPlayAgain: () => ref.read(gameProvider.notifier).resetGame(),
              onGoHome: () => Navigator.of(context).pop(),
            );
          }

          return _buildGameBoard(gameState);
        },
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading vocabulary...'),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(randomVocabularyProvider(widget.category)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameBoard(GameState gameState) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: const Text(
              'Select one word from each column to match them',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              children: [
                // English Column
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Text(
                          'English',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: gameState.englishWords.length,
                          itemBuilder: (context, index) {
                            final word = gameState.englishWords[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: WordCard(
                                word: word,
                                onTap: () => ref.read(gameProvider.notifier).selectEnglishWord(word.id),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Arabic Column
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Text(
                          'العربية',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: gameState.arabicWords.length,
                          itemBuilder: (context, index) {
                            final word = gameState.arabicWords[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: WordCard(
                                word: word,
                                onTap: () => ref.read(gameProvider.notifier).selectArabicWord(word.id),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================
// 8. CATEGORY SELECTION & APP SETUP
// =====================================

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: CategoryEnum.values.length,
        itemBuilder: (context, index) {
          final category = CategoryEnum.values[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(category.name.toUpperCase()),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VocabularyMatchingGame(category: category),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
