import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
            title: Text('Приложение'),
            bottom: TabBar(
              tabs: [
              Tab(text: 'Новости'),
              Tab(text: 'Чаты'),
              Tab(text: 'Профиль'),
            ],
            ),
          ) ,
          body: TabBarView(
            children: [
              Center(child: Text('Новости')),
              Center(child: Text('Чаты')),
              Center(child: Text('Профиль')),

            ],
        )) ,
      ),
    );
  }
}