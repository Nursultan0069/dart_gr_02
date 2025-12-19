void main() {
  //Программа "Моя визитка"
  String name = 'Nursultan';
  int age = 19;
  String city = 'Bishkek';
  String job = 'Software ingineer';
  String passinon = 'Play guitar';
  int salary = 2500;

  print("Hello! My name's $name");
  print("I'm $age years old and I live in $city");
  print("My profession is $job");
  print("In my free time, I engoy $passinon");
  //Расчёт дохода
  print("My yearly income: ${salary * 12} USD");
  print(
    "My yearly income with 10% bonus:${(salary * 12) + (salary * 12 ~/ 10)} USD",
  );
  // Работа со строкой
  String word = " Knowledge is power, but practice makes perfect. ";
  print(word.trim());
  print(word.toUpperCase());
  print(word.replaceAll('practice', 'experience'));
  print(word.contains('power'));
  //Математическая задача
  int apples = 5;
  int people = 7;
  print("Each person gets ${people ~/ apples} apples");
  print("Apples left: ${people % people}");
  //Год рождения
  int currenYear = 2025;
  int myAge = 19;
  print("I was born in ${currenYear - myAge}");
  // var, final и const
  var city1 = "Bishkek";
  city1 = "Osh";
  final country = "Kyrgyzstan";
  //country = "Kazakhstan"; //final переменные нельзя изменять
  const planet = "Earth";
  //planet = "Mars";//const переменные — неизменяемые

  print("City: $city1");
  print("Country: $country");
  print("Planet: $planet");
}
