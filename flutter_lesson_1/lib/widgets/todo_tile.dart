import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;

  const TodoTile({
    super.key,
    required this.todo,
    required this.onToggle,
  });

  String _formatDate(DateTime d) {
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    final yy = (d.year % 100).toString().padLeft(2, '0');
    return '$dd.$mm.$yy';
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF007AFF);

    return Container(
      height: 61,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: todo.isDone
                  ? const Icon(Icons.check, size: 18, color: Colors.black)
                  : null,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                decoration: todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 2,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.white),
              const SizedBox(width: 6),
              Text(
                _formatDate(todo.date),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}