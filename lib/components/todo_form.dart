import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../provider/todo_provider.dart';

class TodoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  TodoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: '제목을 입력해주세요',
              border: OutlineInputBorder(),
            ),
            controller: _titleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '제목은 비어있을 수 없습니다.';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: '설명을 입력해주세요',
              border: OutlineInputBorder(),
            ),
            controller: _descriptionController,
            validator: (value) {
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () => _onFormSubmit(context),
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }

  void _onFormSubmit(BuildContext context) {
    final todoProvider = context
        .dependOnInheritedWidgetOfExactType<TodoInherited>();

    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final todo = Todo(title: title, description: description);
      todoProvider?.addTodo(todo);

      _titleController.clear();
      _descriptionController.clear();
    }
  }
}
