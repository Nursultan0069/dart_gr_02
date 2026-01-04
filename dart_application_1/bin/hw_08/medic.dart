import 'hero.dart';
import 'boss.dart';
import 'super_ability.dart';

class Medic extends Hero {
  int healPoints;

  Medic(String name, int health, int damage, this.healPoints)
      : super(name, health, damage, SuperAbility.HEAL);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero hero in heroes) {
      if (hero.health > 0 && hero.health < 100) {
        hero.health += healPoints;
        print('Medic $name healed ${hero.name} for $healPoints');
        break;
      }
    }
  }
}
