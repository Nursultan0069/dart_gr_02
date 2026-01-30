import 'package:flutter/material.dart';

class Contact2PageApp extends StatelessWidget {
  const Contact2PageApp({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = const [
      ('Арген', 'в сети', 'A'),
      ('Актан', 'в сети', 'M'),
      ('Данияр', 'в сети', 'Д'),
      ('Кана', 'в сети', 'A'),
      ('Аяна', 'в сети', 'F'),
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: contacts.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, i) {
        final (name, status, letter) = contacts[i];
        return ListTile(
          leading: CircleAvatar(child: Text(letter)),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(status),
        );
      },
    );
  }
}
