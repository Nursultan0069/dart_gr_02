import 'dart:io';

void main() {
  int warm = 0;
  int cool = 0;
  int cold = 0;

  for (int i = 0; i < 7; i++) {
    print('Введите температуру на день!');
    int temperature = int.parse(stdin.readLineSync()!);
    if (temperature > 20) {
      print("It's warm today!");
      warm++;
    } else if (10 <= temperature && temperature <= 20) {
      print("It's cool today.");
      cool++;
    } else if (temperature < 10) {
      print(" It's cold today!");
      cold++;
    }
  }
  print('Warm days: $warm');
  print('Warm days: $cool');
  print('Warm days: $cold');
  print('Weekly temperature analysis completed.');
}
