import 'boss.dart';
import 'super_ability.dart';

abstract class Hero {
  String name;
  int health;
  int damage;
  SuperAbility ability;

  Hero(this.name, this.health, this.damage, this.ability);

  bool isAlive() {
    return health > 0;
  }

  void attack(Boss boss) {
    if (isAlive()) {
      boss.health -= damage;
    }
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}
