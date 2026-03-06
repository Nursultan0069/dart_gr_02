import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const _key = "onboarding_seen";

  static Future<bool> isSeen() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(_key) ?? false;
  }

  static Future<void> setSeen() async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_key, true);
  }
}