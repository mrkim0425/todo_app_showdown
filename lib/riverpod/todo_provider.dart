import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String description) {
    state = [...state, Todo(description: description)];
  }

  void toggleTodo(Todo todo) {
    state = state.map((t) {
      if (t == todo) {
        return Todo(description: t.description, completed: !t.completed);
      }
      return t;
    }).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
