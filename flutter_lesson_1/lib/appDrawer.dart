import 'package:flutter/material.dart';
import 'theme_controller.dart';
import 'settingsPage.dart';

class AppDrawer extends StatelessWidget {
  final ThemeController theme;
  final Function(int) onSelectTab;

  const AppDrawer({
    super.key,
    required this.theme,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _header(),

          _item(Icons.chat_bubble_outline, 'Чаты', () => onSelectTab(0)),
          _item(Icons.call_outlined, 'Звонки', () => onSelectTab(1)),
          _item(Icons.people_alt_outlined, 'Контакты', () => onSelectTab(2)),

          const Divider(),

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Тёмная тема'),
            value: theme.isDark,
            onChanged: theme.toggle,
          ),

          _item(Icons.settings_outlined, 'Настройки', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SettingsPage(theme: theme),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _header() {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF1F3057),
      alignment: Alignment.bottomLeft,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 28, child: Icon(Icons.person)),
          SizedBox(height: 12),
          Text('Нурсултан Таалайбекович',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text('+996704651636', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
