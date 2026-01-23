import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PageView пример'),
          centerTitle: true,
        ),
        body: PageView(
          children: [
           page('Добро пожоловать', Colors.amber),
           page('Изучай Flutter', Colors.blue),
           page('Создавай приложение', Colors.green), 
          ],
        ),
      ),
    );
  }

}

Widget page(String text, Color color){
  return Container(
    color: color,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}