import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final bg = isDarkTheme ? Colors.black : Colors.white;
    final text = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        iconTheme: IconThemeData(color: text),
        title: Text('Настройки', style: TextStyle(color: text)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDarkTheme ? Colors.white24 : Colors.black12,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.dark_mode, color: text),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Тёмная тема',
                  style: TextStyle(
                    color: text,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Switch(
                value: isDarkTheme,
                onChanged: (value) {
                  setState(() => isDarkTheme = value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}