class Todo {
  final int id;
  final String title;
  final DateTime date;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  Todo copyWith({
    int? id,
    String? title,
    DateTime? date,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }
}