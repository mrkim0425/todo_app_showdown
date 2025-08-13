import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/todo_list_view.dart';
import 'todo_provider.dart';

class RiverpodTodoApp extends ConsumerWidget {
  const RiverpodTodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);

    return TodoListView(
      todos: todos,
      onAddTodo: (description) {
        todoNotifier.addTodo(description);
      },
      onToggleTodo: (todo) {
        todoNotifier.toggleTodo(todo);
      },
    );
  }
}
