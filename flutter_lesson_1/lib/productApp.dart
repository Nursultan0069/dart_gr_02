import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/productCard.dart';

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Товары"),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final bottomPadding = MediaQuery.of(context).padding.bottom;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPadding + 16),
              child: Column(
                children: [
                  // ----------------------- ПЕРВАЯ СТРОКА -----------------------
                  Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          image: 'images/nike.jpg',
                          title: 'Nike Air Max',
                          price: '\$120',
                          category: 'Обувь',
                          rating: 4,
                          sale: true,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ProductCard(
                          image: "images/leatherbag.jpg",
                          title: "Leather Bag",
                          price: "\$85",
                          category: "Сумки",
                          rating: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // ----------------------- ВТОРАЯ СТРОКА -----------------------
                  Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          image: "images/headphones.jpg",
                          title: "Headphones",
                          price: "\$210",
                          category: "Аудио",
                          rating: 3,
                          sale: true,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ProductCard(
                          image: "images/smartwatch.jpg",
                          title: "Smart Watch",
                          price: "\$150",
                          category: "Гаджеты",
                          rating: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
