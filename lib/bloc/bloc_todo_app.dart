import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/todo_list_view.dart';
import 'todo_bloc.dart';
import 'todo_state.dart';

class BlocTodoApp extends StatelessWidget {
  const BlocTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return TodoListView(
            todos: state.todos,
            onAddTodo: (description) {
              context.read<TodoBloc>().add(AddTodoEvent(description));
            },
            onToggleTodo: (todo) {
              context.read<TodoBloc>().add(ToggleTodoEvent(todo));
            },
          );
        },
      ),
    );
  }
}
