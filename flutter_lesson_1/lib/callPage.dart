import 'package:flutter/material.dart';

class CallPage extends StatelessWidget{
  const CallPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Звонки'),
      ),
      body: Center(
        child: Text('Список звонков',
        style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  
}

