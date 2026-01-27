import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/orderPage.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  ProductDetailPage({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text(desc),
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Купить'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderPage(productTitle: title),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

