import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CatalogItem {
  final String title;
  final String description;
  final IconData icon;

  const CatalogItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final List<CatalogItem> items = List.generate(
    10,
    (i) => CatalogItem(
      title: 'Item ${i + 1}',
      description: 'Описание элемента ${i + 1}',
      icon: Icons.description, // можно заменить на любую иконку
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Контрольная работа №2',
      home: CatalogScreen(items: items),
    );
  }
}

/// Экран 1: Каталог (StatelessWidget + ListView.builder)
class CatalogScreen extends StatelessWidget {
  final List<CatalogItem> items;

  const CatalogScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контрольная работа №2'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Каталог',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: items.length, // 10 элементов
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    subtitle: Text(item.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(item: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Экран 2: Детали (StatefulWidget, данные через конструктор)
class DetailScreen extends StatefulWidget {
  final CatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final buttonText = isFavorite ? 'Добавлено в избранное' : 'Добавить в избранное';
    final buttonColor = isFavorite ? Colors.green : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.item.description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                label: Text(buttonText),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; // меняем текст + цвет
                  });
                },
              ),
            ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
