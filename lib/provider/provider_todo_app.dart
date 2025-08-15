import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/todo_list_view.dart';
import 'todo_notifier.dart';

class ProviderTodoApp extends StatelessWidget {
  const ProviderTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoNotifier(),
      child: Consumer<TodoNotifier>(
        builder: (context, todoNotifier, child) {
          return TodoListView(
            todos: todoNotifier.todos,
            onAddTodo: (description) {
              todoNotifier.addTodo(description);
            },
            onToggleTodo: (todo) {
              todoNotifier.toggleTodo(todo);
            },
          );
        },
      ),
    );
  }
}
