import 'package:flutter/material.dart';
import 'package:flutter_practice/provider/todo_provider.dart';
import 'package:flutter_practice/screen/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      child: MaterialApp(
        title: 'Flutter TODO',
        debugShowCheckedModeBanner: false,
        home: const TodoScreen(),
      ),
    );
  }
}
