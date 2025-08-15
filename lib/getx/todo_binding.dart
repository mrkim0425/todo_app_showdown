import 'package:get/get.dart';
import 'todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // Register the controller (will be disposed when not needed)
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
