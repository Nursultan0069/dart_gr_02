import '../database/app_database.dart';
import '../models/todo.dart';

class ToDoRepository {
  final AppDatabase db;

  ToDoRepository(this.db);

  Future<List<Todo>> getTodos() => db.getTodos();

  Future<void> addTodo(Todo todo) => db.addTodo(todo);

  Future<void> updateTodo(Todo todo) => db.updateTodo(todo);
}