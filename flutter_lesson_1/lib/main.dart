import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database/app_database.dart';
import 'repository/todo_repository.dart';
import 'home/home_page.dart';
import 'models/todo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    final repo = ToDoRepository(db);

   
    repo.addTodo(Todo(id: 1, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14)));
    repo.addTodo(Todo(id: 2, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14), isDone: true));
    repo.addTodo(Todo(id: 3, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14)));
    repo.addTodo(Todo(id: 4, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14)));

    return RepositoryProvider<ToDoRepository>(
      create: (_) => repo,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}