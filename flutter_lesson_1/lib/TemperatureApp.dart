import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(TemperatureApp());

class TemperatureApp extends StatefulWidget {
  @override
  TemperatureAppState createState() => TemperatureAppState();
}

class TemperatureAppState extends State<TemperatureApp> {
  int temperature = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Температура'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text('Температура', style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),

              Text(
                '$temperature градусов',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: temperature > 0 ? Colors.red : Colors.blue,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temperature--;
                      });
                    },
                    child: Text('Уменьшить'),
                  ),
                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temperature++;
                      });
                    },
                    child: Text('Увеличить'),
                  ),
                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temperature = 0;
                      });
                    },
                    child: Text('Сброс'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
