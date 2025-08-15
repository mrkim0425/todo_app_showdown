import 'package:get/get.dart';
import '../common/todo.dart';

class TodoController extends GetxController {
  final RxList<Todo> _todos = <Todo>[].obs;

  List<Todo> get todos => _todos.value;

  int get totalTodos => _todos.length;
  int get completedTodos => _todos.where((todo) => todo.completed).length;
  int get pendingTodos => _todos.where((todo) => !todo.completed).length;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some sample data if needed
    _loadInitialData();
  }

  void _loadInitialData() {
    // This could be loading from local storage, API, etc.
    // For demo purposes, starting with empty list
  }

  Future<void> addTodo(String description) async {
    if (description.trim().isNotEmpty) {
      final newTodo = Todo(description: description.trim());
      _todos.add(newTodo);
      await _saveTodos(); // Simulate saving to storage
    }
  }

  Future<void> toggleTodo(Todo todo) async {
    final index = _todos.indexOf(todo);
    if (index != -1) {
      _todos[index] = Todo(
        description: todo.description,
        completed: !todo.completed,
      );
      await _saveTodos();
    }
  }

  Future<void> removeTodo(Todo todo) async {
    _todos.remove(todo);
    await _saveTodos();
  }

  Future<void> clearCompleted() async {
    _todos.removeWhere((todo) => todo.completed);
    await _saveTodos();
  }

  Future<void> _saveTodos() async {
    // Simulate async save operation
    await Future.delayed(const Duration(milliseconds: 100));
    // Here you would save to local storage, API, etc.
  }

  @override
  void onClose() {
    _todos.close();
    super.onClose();
  }
}
