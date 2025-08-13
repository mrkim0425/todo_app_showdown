
import 'package:flutter/material.dart';
import './todo_state.dart';

class TodoProvider extends InheritedWidget {
  final AppState appState;

  const TodoProvider({
    super.key,
    required this.appState,
    required super.child,
  });

  static AppState of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<TodoProvider>();
    if (provider == null) {
      throw 'TodoProvider not found';
    }
    return provider.appState;
  }

  @override
  bool updateShouldNotify(TodoProvider oldWidget) {
    return appState != oldWidget.appState;
  }
}
