import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/todo.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_onAddTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final newTodo = Todo(description: event.description);
    final updatedTodos = List<Todo>.from(state.todos)..add(newTodo);
    emit(state.copyWith(todos: updatedTodos));
  }

  void _onToggleTodo(ToggleTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = state.todos.map((todo) {
      if (todo == event.todo) {
        return Todo(description: todo.description, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: updatedTodos));
  }
}
