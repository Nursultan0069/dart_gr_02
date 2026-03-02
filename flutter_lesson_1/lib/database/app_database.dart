import '../models/todo.dart';

class AppDatabase {
  final List<Todo> _todos = [];

  Future<List<Todo>> getTodos() async => List.unmodifiable(_todos);


  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    final i = _todos.indexWhere((t) => t.id == todo.id);
    if (i != -1) _todos[i] = todo;
  }
}