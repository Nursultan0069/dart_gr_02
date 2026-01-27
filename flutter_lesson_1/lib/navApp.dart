import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/productListPage.dart';

class NavApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }

}