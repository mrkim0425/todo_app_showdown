
import 'package:flutter/material.dart';
import '../common/todo_list_view.dart';
import './todo_model.dart';
import './todo_state.dart';

class InheritedTodoApp extends StatefulWidget {
  const InheritedTodoApp({super.key});

  @override
  State<InheritedTodoApp> createState() => _InheritedTodoAppState();
}

class _InheritedTodoAppState extends State<InheritedTodoApp> {
  final AppState _appState = AppState();

  @override
  void initState() {
    super.initState();
    _appState.addListener(_onStateChanged);
  }

  @override
  void dispose() {
    _appState.removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      appState: _appState,
      child: Builder(
        builder: (context) {
          final appState = TodoProvider.of(context);
          return TodoListView(
            todos: appState.todos,
            onAddTodo: (description) {
              appState.addTodo(description);
            },
            onToggleTodo: (todo) {
              appState.toggleTodo(todo);
            },
          );
        },
      ),
    );
  }
}
