import 'dart:math';

import 'boss.dart';
import 'hero.dart';
import 'warrior.dart';
import 'magic.dart';
import 'medic.dart';
import 'berserk.dart';
import 'ludoman.dart';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void start() {
    Boss boss = Boss('Dark Lord', 1000, 50);

    List<Hero> heroes = [
      Warrior('Warrior', 250, 30),
      Magic('Magic', 200, 20),
      Medic('Medic', 220, 10, 25),
      Berserk('Berserk', 240, 25),
      Ludoman('Ludoman', 120, 10),
    ];

    print('Game started');

    while (boss.isAlive() && heroes.any((h) => h.isAlive())) {
      roundNumber++;
      print('\nROUND $roundNumber');

      boss.attack(heroes);

      for (Hero hero in heroes) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }

      print('Boss health: ${boss.health}');
      for (Hero hero in heroes) {
        print('${hero.name}: ${hero.health}');
      }
    }

    print(boss.health <= 0 ? 'Heroes won!' : 'Boss won!');
  }
}
