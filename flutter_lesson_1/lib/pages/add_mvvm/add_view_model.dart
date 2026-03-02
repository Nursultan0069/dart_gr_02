import '../../models/todo.dart';
import '../../repository/todo_repository.dart';

class AddViewModel {
  final ToDoRepository repo;

  AddViewModel(this.repo);


  Future<void> addTodo(String title) async {
    final now = DateTime.now();

    final todo = Todo(
      id: now.microsecondsSinceEpoch,
      title: title,
      date: now,
      isDone: false,
    );

    await repo.addTodo(todo);
  }
}