import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/productDetailPage.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    25,
    (i) => {
      'title': 'Товар ${i + 1}',
      'desc': 'Описание товара ${i + 1}',
      'image': 'https://picsum.photos/seed/item$i/200/140',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список товаров')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                      title: item['title']!,
                      desc: item['desc']!,
                      imageUrl: item['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

