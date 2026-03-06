import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../utils/prefs.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int index = 0;

  static const bg = Color(0xFFF2F2F7);
  static const blue = Color(0xFF007AFF);
  static const redLogo = Color(0xFFE74C3C);

  final pages = const [
    _OnboardData(
      title: "Todolist",
      subtitle:
          "Добро пожаловать!\nОрганизуйте свою жизнь с Todolist - приложением для управления задачами",
      image: Icons.check_circle,
    ),
    _OnboardData(
      title: "Все задачи\nв одном месте",
      subtitle:
          "Добавляйте, упорядочивайте и управляйте задачами на день, неделю и месяц",
      image: Icons.task_alt,
    ),
  ];

  void next() {
    if (index == pages.length - 1) {
      finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> finish() async {
    await Prefs.setSeen();
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: finish,
            child: const Text(
              "Пропустить",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => index = i),
              itemBuilder: (_, i) {
                final item = pages[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ЛОГОТИП
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: redLogo,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.checklist,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),

                      const SizedBox(height: 40),

                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.6),
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 40),

                      Icon(item.image, size: 120, color: redLogo),
                    ],
                  ),
                );
              },
            ),
          ),

          // Индикаторы
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: index == i ? 18 : 8,
                decoration: BoxDecoration(
                  color: index == i ? blue : Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Кнопка
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 0, 23, 30),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: next,
                child: Text(
                  index == pages.length - 1 ? "Начать" : "Далее",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardData {
  final String title;
  final String subtitle;
  final IconData image;

  const _OnboardData({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}