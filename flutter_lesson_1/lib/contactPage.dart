import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> calls = [
      {
        'name': 'Нурс',
        'when': 'Сегодня',
        'outgoing': true,
        'letter': 'M',
      },
      {
        'name': 'Кана',
        'when': 'Вчера',
        'outgoing': false,
        'letter': 'A',
      },
      {
        'name': 'Сули',
        'when': '20 мая',
        'outgoing': true,
        'letter': 'M',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: calls.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final call = calls[i];

        return ListTile(
          leading: CircleAvatar(
            child: Text(call['letter']),
          ),
          title: Text(
            call['name'],
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(call['when']),
          trailing: Icon(
            call['outgoing']
                ? Icons.call_made
                : Icons.call_received,
            color: Colors.green,
          ),
        );
      },
    );
  }
}
