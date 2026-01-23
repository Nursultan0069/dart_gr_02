import 'package:flutter/material.dart';

class GridViewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
        ),
        body: GridView.builder(
         padding: EdgeInsets.all(12),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)],
              ),
              child: Column(
                children: [
                  Expanded(child: Icon(Icons.shopping_bag, size: 60)),
                  Text('Товар ${index+1}'),
                  SizedBox(height: 8),
                ],
              ),
            );
          }),
      ),
    );
  }

}