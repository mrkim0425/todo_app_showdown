
import 'package:flutter/material.dart';
import '../common/todo.dart';

class AppState extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String description) {
    _todos.add(Todo(description: description));
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final index = _todos.indexOf(todo);
    if (index != -1) {
      _todos[index].completed = !_todos[index].completed;
      notifyListeners();
    }
  }
}
