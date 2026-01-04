import 'hero.dart';
import 'boss.dart';
import 'super_ability.dart';

class Magic extends Hero {
  Magic(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.BOOST);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    for (Hero hero in heroes) {
      if (hero.isAlive()) {
        hero.damage += 5;
      }
    }
    print('Magic $name boosted heroes damage');
  }
}
