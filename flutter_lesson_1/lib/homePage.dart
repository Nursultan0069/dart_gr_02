import 'package:flutter/material.dart';
import 'appDrawer.dart';
import 'theme_controller.dart';
import 'contactPage.dart';
import 'contact2Page.dart';

class HomePage extends StatefulWidget {
  final ThemeController theme;
  const HomePage({super.key, required this.theme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void changeTab(int index) {
    setState(() => currentIndex = index);
    Navigator.pop(context); // закрываем Drawer
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const ChatsScreen(),
      const ContactPage(),      // Звонки
      const Contact2PageApp(),  // Контакты
    ];

    final titles = ['Telegram', 'Звонки', 'Контакты'];

    return Scaffold(
      appBar: AppBar(title: Text(titles[currentIndex])),

      drawer: AppDrawer(
        theme: widget.theme,
        onSelectTab: changeTab, // 👈 КЛЮЧЕВО
      ),

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Чаты'),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_outlined), label: 'Звонки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: 'Контакты'),
        ],
      ),
    );
  }
}

/// ===== ЧАТЫ (имитация Telegram) =====
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = const [
      ('Кана', 'Нурс ты домашку сделал?', '12:30', 'A'),
      ('IT Комания', 'Вы будете на нас работать', '11:15', 'F'),
      ('Мама', 'Позвони мне', '10:02', 'M'),
    ];

    return ListView.separated(
      itemCount: chats.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, i) {
        final (name, msg, time, letter) = chats[i];
        return ListTile(
          leading: CircleAvatar(child: Text(letter)),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(msg),
          trailing: Text(time),
        );
      },
    );
  }
}
