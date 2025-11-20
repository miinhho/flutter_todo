import 'package:flutter/material.dart';
import 'package:flutter_practice/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final description = todo.description?.trim();
    return Card(
      margin: const EdgeInsets.all(10),
      shadowColor: Colors.transparent,
      elevation: 0,
      child: ListTile(
        title: Text(
          todo.title,
          style: const TextStyle(fontSize: 18, fontWeight: .bold),
        ),
        subtitle: description?.isNotEmpty == true
            ? Padding(
                padding: const EdgeInsets.only(left: 1.5),
                child: Text(
                  description!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
