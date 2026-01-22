import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String name = 'Tom Hardy';
  final int age = 45;
  final String city = 'London';
  final String bio = 'Actor';

  final List<String> interests = const [
    ' Movies',
    ' Fitness',
    ' Theatre',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300, // фон экрана
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // новый цвет AppBar
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/tomhardy.jpg'),
            ),

            const SizedBox(height: 16),

            // Имя
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Возраст
            Text(
              'Age: $age',
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),

            // Город
            Text(
              city,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 12),

            // Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                bio,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Интересы
            const Text(
              'Interests',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            ...interests.map(
              (interest) => Text(
                interest,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.teal,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Follow',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
