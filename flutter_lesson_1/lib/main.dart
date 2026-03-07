import 'package:flutter/material.dart';
import 'database/app_database.dart';
import 'repository/todo_repository.dart';
import 'home/home_page.dart';
import 'pages/onboarding_page.dart';
import 'utils/prefs.dart';
import 'models/todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final seen = await Prefs.isSeen();
  final db = AppDatabase();
  final repo = ToDoRepository(db);

  await repo.addTodo(
    Todo(
      id: 1,
      title: 'Сделать домашнее задание',
      date: DateTime(2026, 9, 14),
      isDone: false,
    ),
  );
  await repo.addTodo(
    Todo(
      id: 2,
      title: 'Сделать домашнее задание',
      date: DateTime(2026, 9, 14),
      isDone: true,
    ),
  );
  await repo.addTodo(
    Todo(
      id: 3,
      title: 'Сделать домашнее задание',
      date: DateTime(2026, 9, 14),
      isDone: false,
    ),
  );
  await repo.addTodo(
    Todo(
      id: 4,
      title: 'Сделать домашнее задание',
      date: DateTime(2026, 9, 14),
      isDone: false,
    ),
  );

  runApp(MyApp(repo: repo, seen: seen));
}

class MyApp extends StatelessWidget {
  final ToDoRepository repo;
  final bool seen;

  const MyApp({
    super.key,
    required this.repo,
    required this.seen,
  });

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

class InheritedRepo extends InheritedWidget {
  final ToDoRepository repo;

  const InheritedRepo({
    super.key,
    required this.repo,
    required super.child,
  });

  static ToDoRepository of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<InheritedRepo>();
    if (result == null) {
      throw Exception('ToDoRepository not found');
    }
    return result.repo;
  }

  @override
  bool updateShouldNotify(covariant InheritedRepo oldWidget) => false;
}