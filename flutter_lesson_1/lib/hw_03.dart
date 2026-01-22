import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Корневой виджет приложения (StatelessWidget)

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: CalculatorScreen(),
            debugShowCheckedModeBanner: false,
    );
  }
}



// Экран калькулятора (StatefulWidget)

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

// State-класс — хранит состояние калькулятора

class CalculatorScreenState extends State<CalculatorScreen> {
  // Контроллеры для полей ввода

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  double result = 0;

  // Получение чисел из полей
  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мини-калькулятор"),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            

// ----------- ПЕРВОЕ ЧИСЛО -----------
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Первое число",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            // ----------- ВТОРОЕ ЧИСЛО -----------
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Второе число",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 24),

            // ----------- КНОПКИ +  −  СБРОС -----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue + secondValue;
                    });
                  },
                  child: Text("+", style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue - secondValue;
                    });
                  },
                  child: Text("−", style: TextStyle(fontSize: 24)),
                ),
                 ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue * secondValue;
                    });
                  },
                  child: Text("*", style: TextStyle(fontSize: 24)),
                ),
                 ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (secondValue== 0){
                        result= 0;
                      }
                      else{
                      result = firstValue / secondValue;
                      };
                    });
                  },
                  child: Text("/", style: TextStyle(fontSize: 24)),
                ),


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: resetCalculator,
                  child: Text(
                    "Сброс",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // ----------- РЕЗУЛЬТАТ -----------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 47, 6, 180),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Результат: $result",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
