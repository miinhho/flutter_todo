import 'package:flutter/material.dart';
import 'package:flutter_practice/components/todo_item.dart';

import '../components/todo_form.dart';
import '../provider/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context
        .dependOnInheritedWidgetOfExactType<TodoInherited>();
    final todo = todoProvider?.todoList;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: todo == null || todo.isEmpty
                    ? _buildEmptyTodoScreen()
                    : ListView.builder(
                        itemCount: todo.length,
                        itemBuilder: (context, index) => Dismissible(
                          key: Key('${todo[index].title}-$index'),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction) =>
                              _onDismissed(context, index),
                          background: _buildDismissBackground(
                            Alignment.centerLeft,
                          ),
                          secondaryBackground: _buildDismissBackground(
                            Alignment.centerRight,
                          ),
                          child: TodoItem(todo: todo[index]),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              TodoForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyTodoScreen() => const Center(child: Text('등록된 할 일이 없어요.'));

  void _onDismissed(BuildContext context, int index) {
    final todoProvider = context
        .dependOnInheritedWidgetOfExactType<TodoInherited>();
    todoProvider?.removeTodo(index);
  }

  Widget _buildDismissBackground(Alignment alignment) => Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(12),
    ),
    alignment: alignment,
    child: const Icon(Icons.delete, size: 28, color: Colors.white),
  );
}
