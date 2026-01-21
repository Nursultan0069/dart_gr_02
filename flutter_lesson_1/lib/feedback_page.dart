import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String name = "";
  bool isSent = false;

  final TextEditingController controller = TextEditingController();

  void sendForm() {
    if (name.isEmpty) return;

    setState(() {
      isSent = true;
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обратная связь'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Stateless часть
            const Text(
              'Обратная связь',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Пожалуйста, заполните форму ниже и нажмите кнопку отправки.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            // 🔹 Stateful часть
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Ваше имя',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                name = value;
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: sendForm,
              child: const Text('Отправить'),
            ),

            const SizedBox(height: 20),

            // 🔹 Условный текст
            if (isSent)
              Text(
                'Отправлено! Спасибо, $name',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
