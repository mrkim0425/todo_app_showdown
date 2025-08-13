import '../common/todo.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String description;
  AddTodoEvent(this.description);
}

class ToggleTodoEvent extends TodoEvent {
  final Todo todo;
  ToggleTodoEvent(this.todo);
}

class TodoState {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }
}
