import 'package:flutter/material.dart';
import 'package:flutter_practice/models/todo.dart';

class TodoInherited extends InheritedWidget {
  final List<Todo> todoList;
  final void Function(Todo) addTodo;
  final void Function(int) removeTodo;

  const TodoInherited({
    super.key,
    required super.child,
    required this.todoList,
    required this.addTodo,
    required this.removeTodo,
  });

  static TodoInherited of(BuildContext context) {
    final TodoInherited? result = context
        .dependOnInheritedWidgetOfExactType<TodoInherited>();
    assert(result != null, 'No TodoProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoInherited old) => todoList != old.todoList;
}

class TodoProvider extends StatefulWidget {
  final Widget child;

  const TodoProvider({super.key, required this.child});

  @override
  State<TodoProvider> createState() => _TodoProviderState();
}

class _TodoProviderState extends State<TodoProvider> {
  List<Todo> _todos = [];

  void addTodo(Todo todo) {
    setState(() {
      _todos = [..._todos, todo];
    });
  }

  void removeTodo(int index) {
    setState(() {
      _todos = [..._todos.take(index), ..._todos.skip(index + 1)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return TodoInherited(
      todoList: _todos,
      addTodo: addTodo,
      removeTodo: removeTodo,
      child: widget.child,
    );
  }
}
