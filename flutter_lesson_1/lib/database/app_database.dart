import '../models/todo.dart';

class AppDatabase {
  final List<Todo> _todos = [];

  Future<List<Todo>> getTodos() async {
    return List.unmodifiable(_todos);
  }

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    final index = _todos.indexWhere((t) => t.id == todo.id);

    if (index != -1) {
      _todos[index] = todo;
    }
  }
}