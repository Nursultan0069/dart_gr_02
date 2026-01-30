import 'package:flutter/material.dart';
import 'theme_controller.dart';

class SettingsPage extends StatelessWidget {
  final ThemeController theme;
  const SettingsPage({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Аккаунт'),
            subtitle: const Text('Имя, номер, фото'),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Уведомления'),
            subtitle: const Text('Звуки, вибрация, баннеры'),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Конфиденциальность'),
            subtitle: const Text('Пароль, блокировки'),
            onTap: () {},
          ),
          const Divider(height: 1),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Тёмная тема'),
            value: theme.isDark,
            onChanged: theme.toggle,
          ),
        ],
      ),
    );
  }
}
