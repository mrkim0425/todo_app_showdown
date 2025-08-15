import 'package:get/get.dart';
import 'getx_todo_app.dart';
import 'todo_binding.dart';

class TodoRoutes {
  static const String todo = '/getx-todo';
  static const String todoDetails = '/getx-todo/details';

  static List<GetPage> routes = [
    GetPage(
      name: todo,
      page: () => const GetXTodoApp(),
      binding: TodoBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Example of additional route with parameters
  ];
}
