import 'package:flutter/material.dart';
import '../main.dart'; // чтобы взять InheritedRepo
import '../models/todo.dart';
import '../pages/add_todo_page.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = InheritedRepo.of(context);
    final list = await repo.getTodos();
    setState(() => todos = list);
  }

  Future<void> _openAdd() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTodoPage()),
    );

    if (result == true) {
      await _load(); // ✅ обновляем список
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
            onToggle: () async {
              todo.isDone = !todo.isDone;
              await InheritedRepo.of(context).updateTodo(todo);
              await _load();
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
              onPressed: _openAdd,
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