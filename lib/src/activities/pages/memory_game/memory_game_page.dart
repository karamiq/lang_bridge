import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/components/custom_animation_builder.dart';
import 'package:lang_bridge/data/models/category_model.dart';
import 'dart:math';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({
    super.key,
  });

  @override
  State<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> with TickerProviderStateMixin {
  List<CategorynModel> _words = [];
  List<GameCard> _gameCards = [];
  List<int> _flippedCards = [];
  List<int> _matchedCards = [];
  bool _isLoading = true;
  bool _isChecking = false;
  int _score = 0;
  int _moves = 0;
  late AnimationController _flipController;
  late AnimationController _matchController;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _matchController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _loadWordsFromFirestore();
  }

  @override
  void dispose() {
    _flipController.dispose();
    _matchController.dispose();
    super.dispose();
  }

  Future<void> _loadWordsFromFirestore() async {
    try {
      setState(() => _isLoading = true);

      var query = FirebaseFirestore.instance.collection('categories');

      QuerySnapshot snapshot = await query.limit(8).get();

      List<CategorynModel> words = snapshot.docs.map((doc) {
        return CategorynModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      if (words.isEmpty) {
        // Fallback to local data if Firestore is empty
        words = wordBank.take(8).toList();
      }

      _setupGame(words);
    } catch (e) {
      // Fallback to local data on error
      List<CategorynModel> words = wordBank.take(8).toList();
      _setupGame(words);
    }
  }

  void _setupGame(List<CategorynModel> words) {
    _words = words;
    _gameCards = [];

    // Create cards for English and Arabic pairs
    for (int i = 0; i < _words.length; i++) {
      _gameCards.add(GameCard(
        id: i * 2,
        text: _words[i].english,
        pronunciation: _words[i].englishPronunciation,
        isEnglish: true,
        wordId: _words[i].id,
        category: _words[i].category,
      ));

      _gameCards.add(GameCard(
        id: i * 2 + 1,
        text: _words[i].arabic,
        pronunciation: _words[i].arabicPronunciation,
        isEnglish: false,
        wordId: _words[i].id,
        category: _words[i].category,
      ));
    }

    // Shuffle the cards
    _gameCards.shuffle(Random());

    setState(() {
      _isLoading = false;
      _flippedCards.clear();
      _matchedCards.clear();
      _score = 0;
      _moves = 0;
    });
  }

  void _onCardTapped(int index) {
    if (_isChecking || _flippedCards.contains(index) || _matchedCards.contains(index)) {
      return;
    }

    setState(() {
      _flippedCards.add(index);
    });

    if (_flippedCards.length == 2) {
      _moves++;
      _checkForMatch();
    }
  }

  void _checkForMatch() {
    setState(() => _isChecking = true);

    Future.delayed(const Duration(milliseconds: 1000), () {
      int firstIndex = _flippedCards[0];
      int secondIndex = _flippedCards[1];

      GameCard firstCard = _gameCards[firstIndex];
      GameCard secondCard = _gameCards[secondIndex];

      bool isMatch = firstCard.wordId == secondCard.wordId && firstCard.isEnglish != secondCard.isEnglish;

      if (isMatch) {
        setState(() {
          _matchedCards.addAll(_flippedCards);
          _score += 10;
        });

        _matchController.forward().then((_) {
          _matchController.reset();
        });

        // Check if game is complete
        if (_matchedCards.length == _gameCards.length) {
          _showGameCompleteDialog();
        }
      }

      setState(() {
        _flippedCards.clear();
        _isChecking = false;
      });
    });
  }

  void _showGameCompleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('🎉 Congratulations!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You completed the memory game!'),
              const SizedBox(height: 16),
              Text('Score: $_score'),
              Text('Moves: $_moves'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                _resetGame();
              },
              child: const Text('Play Again'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Back to Menu'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    _setupGame(_words);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Game - ALL}'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _resetGame,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Game Stats
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard('Score', _score.toString(), Icons.star),
                      _buildStatCard('Moves', _moves.toString(), Icons.touch_app),
                      _buildStatCard('Pairs', '${_matchedCards.length ~/ 2}/${_gameCards.length ~/ 2}',
                          Icons.check_circle),
                    ],
                  ),
                ),

                // Game Grid
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: _gameCards.length,
                      itemBuilder: (context, index) {
                        return _buildGameCard(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.deepPurple),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(int index) {
    GameCard card = _gameCards[index];
    bool isFlipped = _flippedCards.contains(index) || _matchedCards.contains(index);
    bool isMatched = _matchedCards.contains(index);

    return GestureDetector(
      onTap: () => _onCardTapped(index),
      child: CustomAnimationBuilder(builder: (animation) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isMatched
                  ? const Color.fromARGB(255, 13, 19, 13)
                  : isFlipped
                      ? Colors.white
                      : Colors.deepPurple.shade100,
              border: Border.all(
                color: isMatched
                    ? Colors.green
                    : isFlipped
                        ? Colors.deepPurple
                        : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value * pi),
              child: isFlipped
                  ? _buildCardFront(card, isMatched)
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: _buildCardBack(),
                    ),
              // child: AnimatedSwitcher(
              //   duration: const Duration(milliseconds: 300),
              //   child: isFlipped ? _buildCardFront(card, isMatched) : _buildCardBack(),
            ));
      }),
    );
  }

  Widget _buildCardFront(GameCard card, bool isMatched) {
    return Container(
      key: ValueKey('front_${card.id}'),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isMatched) const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(height: 4),
          Text(
            card.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: card.isEnglish ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: isMatched ? Colors.green.shade700 : Colors.deepPurple.shade700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            card.pronunciation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.italic,
              color: Colors.grey.shade600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: card.isEnglish ? Colors.blue.shade100 : Colors.orange.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              card.isEnglish ? 'EN' : 'AR',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: card.isEnglish ? Colors.blue.shade700 : Colors.orange.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBack() {
    return Container(
      key: const ValueKey('back'),
      child: const Center(
        child: Icon(
          Icons.psychology,
          size: 40,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class GameCard {
  final int id;
  final String text;
  final String pronunciation;
  final bool isEnglish;
  final String wordId;
  final CategoryEnum category;

  GameCard({
    required this.id,
    required this.text,
    required this.pronunciation,
    required this.isEnglish,
    required this.wordId,
    required this.category,
  });
}
