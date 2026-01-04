import 'hero.dart';
import 'boss.dart';
import 'super_ability.dart';

class Berserk extends Hero {
  Berserk(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.BLOCK_DAMAGE);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (isAlive()) {
      int blocked = boss.damage ~/ 2;
      boss.health -= blocked;
      print('Berserk $name returned $blocked damage to boss');
    }
  }
}
