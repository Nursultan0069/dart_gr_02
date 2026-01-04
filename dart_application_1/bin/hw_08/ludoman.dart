import 'hero.dart';
import 'boss.dart';
import 'super_ability.dart';
import 'rpg_game.dart';

class Ludoman extends Hero {
  Ludoman(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.LUDOMAN);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    int dice1 = RpgGame.random.nextInt(6) + 1;
    int dice2 = RpgGame.random.nextInt(6) + 1;

    print('Ludoman $name rolled $dice1 and $dice2');

    if (dice1 == dice2) {
      int dmg = dice1 * dice2;
      boss.health -= dmg;
      print('Ludoman $name hit boss for $dmg damage');
    } else {
      List<Hero> alive =
          heroes.where((h) => h.isAlive() && h != this).toList();

      if (alive.isNotEmpty) {
        Hero unlucky = alive[RpgGame.random.nextInt(alive.length)];
        int dmg = dice1 + dice2;
        unlucky.health -= dmg;
        print(
            'Ludoman $name damaged teammate ${unlucky.name} for $dmg');
      }
    }
  }
}
