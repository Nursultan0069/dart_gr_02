//Прогулка по погоде
import 'dart:io';

void main() {
  print('Ваш возраст');
  int? ageInput = int.parse(stdin.readLineSync()!);
  print('Введите температуру воздуха');
  int? temperature = int.parse(stdin.readLineSync()!);
  if ((19 < ageInput && ageInput < 46) &&
      (-19 < temperature && temperature < 31)) {
    print("you can go for a walk");
  } else if (20 > ageInput && (-1 < temperature && temperature < 29)) {
    print('You can go for a walk');
  } else if (45 < ageInput && (-11 < temperature && temperature < 26)) {
    print('You can go for a walk');
  } else {
    print('Stay home');
  }
  //День недели
  print('Введи день недели');
  String day = stdin.readLineSync()!;

  switch (day) {
    case 'Monday':
      print("It's the start of the week!");
      break;
    case 'Tuesday':
      print("Keep going, almost weekend!");
      break;
    case 'Wednesday':
      print("Keep going, almost weekend!");
      break;
    case 'Thursday':
      print("Keep going, almost weekend!");
      break;
    case 'Friday':
      print("Weekend is coming");
      break;
    case 'Saturday':
      print("Enjoy your weekend!");
      break;
    case 'Sunday':
      print("Enjoy your weekend!");
      break;
    default:
      print("Invalid day");
  }
  //Проверка пароля 🔒 (вложенные условия)
  print("Введите пароль");
  String password = stdin.readLineSync()!;
  print(password.length);
  if (password.isEmpty) {
    
    print("Password cannot be empty.");
  } else if (password.length < 6) {
    print("Password too short.");
  } else if (password.length == 6 || password.length > 6) {
    if (password == "dart123") {
      print("Access granted.");
    } else {
      print("Wrong password.");
    }
  }
}
