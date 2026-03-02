import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../pages/add_todo_page.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> todos = [
    Todo(id: 1, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14)),
    Todo(id: 2, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14), isDone: true),
    Todo(id: 3, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14)),
    Todo(id: 4, title: 'Сделать домашнее задание', date: DateTime(2026, 9, 14)),
  ];

  Future<void> _openAddTodo() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTodoPage()),
    );

    // result = String (название) или null
    if (result is String && result.trim().isNotEmpty) {
      setState(() {
        final nextId = todos.isEmpty ? 1 : (todos.last.id + 1);
        todos.add(
          Todo(
            id: nextId,
            title: result.trim(),
            date: DateTime.now(), // можно поменять если у вас фиксированная дата
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF2F2F7);
    const blue = Color(0xFF007AFF);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Мои задачи',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Color(0x22000000)),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(23, 24, 23, 110),
        itemCount: todos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoTile(
            todo: todo,
            onToggle: () {
              setState(() => todo.isDone = !todo.isDone);
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 12, 23, 20),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _openAddTodo,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Добавить задачу',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}