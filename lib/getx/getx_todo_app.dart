import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/todo_list_view.dart';
import 'todo_controller.dart';

class GetXTodoApp extends StatelessWidget {
  const GetXTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (controller) {
        return Obx(
          () => TodoListView(
            todos: controller.todos,
            onAddTodo: (description) {
              controller.addTodo(description);
            },
            onToggleTodo: (todo) {
              controller.toggleTodo(todo);
            },
          ),
        );
      },
    );
  }
}
