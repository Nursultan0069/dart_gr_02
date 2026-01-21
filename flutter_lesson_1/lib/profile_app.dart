import 'package:flutter/material.dart';
import 'profile_page.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile',
      home: const ProfilePage(),
    );
  }
}
