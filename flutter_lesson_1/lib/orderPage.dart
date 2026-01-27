import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/orderSuccessPage.dart';

class OrderPage extends StatelessWidget {
  final String productTitle;

  OrderPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заказ и оплата')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ваш заказ:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(productTitle),
            const SizedBox(height: 24),
            Text(
              'Способ оплаты',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Банковская карта'),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Электронный кошелёк'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Оплатить'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          OrderSuccessPage(productTitle: productTitle),
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
