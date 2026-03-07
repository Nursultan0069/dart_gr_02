import 'package:flutter/material.dart';

class PairGamePage extends StatefulWidget {
  const PairGamePage({super.key});

  @override
  State<PairGamePage> createState() => _PairGamePageState();
}

class _PairGamePageState extends State<PairGamePage> {
  final List<GameCard> cards = [
    GameCard(id: 1, color: Colors.blue),
    GameCard(id: 2, color: Colors.red),
    GameCard(id: 1, color: Colors.blue),
    GameCard(id: 2, color: Colors.red),
  ];

  final List<int> selectedIndexes = [];
  int wrongAttempts = 0;
  String message = '';

  void onCardTap(int index) {
    if (cards[index].isMatched) return;
    if (cards[index].isOpen) return;
    if (wrongAttempts >= 2) return;
    if (selectedIndexes.length == 2) return;

    setState(() {
      cards[index].isOpen = true;
      selectedIndexes.add(index);
    });

    if (selectedIndexes.length == 2) {
      checkPair();
    }
  }

  void checkPair() {
    final firstIndex = selectedIndexes[0];
    final secondIndex = selectedIndexes[1];

    final firstCard = cards[firstIndex];
    final secondCard = cards[secondIndex];

    if (firstCard.id == secondCard.id) {
      setState(() {
        firstCard.isMatched = true;
        secondCard.isMatched = true;
        message = 'Успешно';
        selectedIndexes.clear();
      });
    } else {
      wrongAttempts++;

      if (wrongAttempts >= 2) {
        setState(() {
          message = 'У вас не осталось попыток';
        });
      } else {
        setState(() {
          message = 'Неверно';
        });
      }

      Future.delayed(const Duration(milliseconds: 700), () {
        if (!mounted) return;

        setState(() {
          firstCard.isOpen = false;
          secondCard.isOpen = false;
          selectedIndexes.clear();
        });
      });
    }
  }

  void restartGame() {
    setState(() {
      cards[0] = GameCard(id: 1, color: Colors.blue);
      cards[1] = GameCard(id: 2, color: Colors.red);
      cards[2] = GameCard(id: 1, color: Colors.blue);
      cards[3] = GameCard(id: 2, color: Colors.red);

      selectedIndexes.clear();
      wrongAttempts = 0;
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF2F2F7);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Найти пару',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: cards.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                final card = cards[index];

                return GestureDetector(
                  onTap: () => onCardTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: card.isOpen || card.isMatched
                          ? card.color
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: message == 'Успешно'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Ошибочные попытки: $wrongAttempts',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: restartGame,
                child: const Text('Начать заново'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameCard {
  final int id;
  final Color color;
  bool isOpen;
  bool isMatched;

  GameCard({
    required this.id,
    required this.color,
    this.isOpen = false,
    this.isMatched = false,
  });
}