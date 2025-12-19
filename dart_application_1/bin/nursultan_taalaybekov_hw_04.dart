int totalCalls = 0;

void greet() {
  print('Hello! Welcome to Dart programming!');
  totalCalls++;
}

void introduce(String name, int age) {
  print('My name is $name and I am $age years old.');
  totalCalls++;
}

void addNumbers(int a, int b) {
  int summa = a + b;
  print('Sum of $a and $b is $summa');
  totalCalls++;
}

double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  double finalPrice = price - (price * discount / 100) + (price * tax / 100);
  totalCalls++;

  return finalPrice;
}

void main() {
  greet();
  greet();
  greet();
  introduce('Alex', 25);
  introduce('Nurs', 19);
  introduce('Kanat', 18);
  addNumbers(5, 8);
  double price1 = calculateDiscount(price: 158);
  print('Final price \$$price1');
  double price2 = calculateDiscount(price: 158, discount: 23.4);
  print('Final price \$$price2');
  double price3 = calculateDiscount(price: 158, discount: 23.4, tax: 68);
  print('Final price \$$price3');
  print('Total function calls: $totalCalls');
}
