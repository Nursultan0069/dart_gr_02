import 'dart:ffi';

void main() {
  //FizzBuzz
  for (int i = 1; i < 31; i++) {
    if (i % 3 == 0 && i % 5 != 0) {
      print('Fizz');
    } else if (i % 5 == 0 && i % 3 != 0) {
      print('Buzz');
    } else if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else {
      print(i);
    }
  }
  // Положительные числа ➕ (среднее значение)
  List<int> number = [3, -2, 0, 7, -5, 10, 1];
  int i = 0;
  int j = 0;
  int k = 0;
  for (var num in number) {
    if (num > 0) {
      i++;
    }
  }
  print('Positive numbers count: $i');
  for (var num in number) {
    if (num > 0) {
      j = j + num;
      k++;
    }
  }
  print('Average of positive numbers:${j / k}');

  //Магазин фруктов
  Map<String, int> Fruits = {'Apple': 5, 'Banana': 2, 'Mango': 7, 'Orange': 0};
  Fruits.forEach((key, value) {
    if (value > 0) {
      print('Available: $key($value)pcs');
    }
  });
}
