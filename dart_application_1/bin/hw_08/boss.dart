import 'hero.dart';

class Boss {
  String name;
  int health;
  int damage;

  Boss(this.name, this.health, this.damage);

  bool isAlive() {
    return health > 0;
  }

  void attack(List<Hero> heroes) {
    for (Hero hero in heroes) {
      if (hero.isAlive()) {
        hero.health -= damage;
      }
    }
  }
}
