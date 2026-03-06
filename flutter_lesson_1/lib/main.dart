import 'package:flutter/material.dart';
import 'database/app_database.dart';
import 'repository/todo_repository.dart';
import 'home/home_page.dart';
import 'pages/onboarding_page.dart';
import 'utils/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final seen = await Prefs.isSeen();

  final db = AppDatabase();
  final repo = ToDoRepository(db);

  runApp(MyApp(repo: repo, seen: seen));
}

class MyApp extends StatelessWidget {
  final ToDoRepository repo;
  final bool seen;

  const MyApp({super.key, required this.repo, required this.seen});

  @override
  Widget build(BuildContext context) {
    return InheritedRepo(
      repo: repo,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: seen ? const HomePage() : const OnboardingPage(),
      ),
    );
  }
}

/// Простой DI без provider/flutter_bloc (чтобы не было ошибок)
class InheritedRepo extends InheritedWidget {
  final ToDoRepository repo;

  const InheritedRepo({
    super.key,
    required this.repo,
    required super.child,
  });

  static ToDoRepository of(BuildContext context) {
    final w = context.dependOnInheritedWidgetOfExactType<InheritedRepo>();
    if (w == null) throw Exception('ToDoRepository not found');
    return w.repo;
  }

  @override
  bool updateShouldNotify(covariant InheritedRepo oldWidget) => false;
}