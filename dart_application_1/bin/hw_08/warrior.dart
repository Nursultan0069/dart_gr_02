import 'hero.dart';
import 'boss.dart';
import 'super_ability.dart';
import 'rpg_game.dart';

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.CRITICAL_DAMAGE);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (isAlive()) {
      int coeff = RpgGame.random.nextInt(2) + 2;
      int extraDamage = damage * coeff;
      boss.health -= extraDamage;
      print('Warrior $name hit critically for $extraDamage damage');
    }
  }
}
