import 'package:flutter/material.dart';
import 'homePage.dart';
import 'theme_controller.dart';

class TelegramApp extends StatefulWidget {
  const TelegramApp({super.key});

  @override
  State<TelegramApp> createState() => _TelegramAppState();
}

class _TelegramAppState extends State<TelegramApp> {
  final theme = ThemeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: theme,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Telegram Drawer',
          themeMode: theme.mode,

          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0xFF4DA3FF),
            scaffoldBackgroundColor: const Color(0xFFF4F7FB),
            drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0xFF4DA3FF),
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF0B1220),
            drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF0F172A)),
          ),

          home: HomePage(theme: theme),
        );
      },
    );
  }
}
