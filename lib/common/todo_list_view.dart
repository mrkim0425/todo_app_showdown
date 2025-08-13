import 'package:flutter/material.dart';
import './todo.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onAddTodo;
  final Function(Todo) onToggleTodo;

  const TodoListView({
    super.key,
    required this.todos,
    required this.onAddTodo,
    required this.onToggleTodo,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.indigo[800],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.indigo[400]!, Colors.purple[400]!],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Input section with enhanced styling
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'What needs to be done?',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.edit_outlined,
                    color: Colors.indigo[400],
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo[400]!, Colors.purple[400]!],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          onAddTodo(controller.text);
                          controller.clear();
                        }
                      },
                    ),
                  ),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    onAddTodo(value);
                    controller.clear();
                  }
                },
              ),
            ),
          ),

          // Todo list section
          Expanded(
            child: todos.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.task_alt, size: 80, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          'No tasks yet!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add a task to get started',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: todo.completed
                                  ? LinearGradient(
                                      colors: [
                                        Colors.green[400]!,
                                        Colors.teal[400]!,
                                      ],
                                    )
                                  : null,
                              border: todo.completed
                                  ? null
                                  : Border.all(
                                      color: Colors.grey[300]!,
                                      width: 2,
                                    ),
                            ),
                            child: Checkbox(
                              value: todo.completed,
                              onChanged: (bool? value) {
                                onToggleTodo(todo);
                              },
                              activeColor: Colors.transparent,
                              checkColor: Colors.white,
                              side: BorderSide.none,
                            ),
                          ),
                          title: Text(
                            todo.description,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: todo.completed
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: todo.completed
                                  ? Colors.grey[400]
                                  : Colors.grey[800],
                            ),
                          ),
                          trailing: todo.completed
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green[400],
                                  size: 24,
                                )
                              : Icon(
                                  Icons.radio_button_unchecked,
                                  color: Colors.grey[300],
                                  size: 24,
                                ),
                        ),
                      );
                    },
                  ),
          ),

          // Bottom summary section
          if (todos.isNotEmpty)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryItem(
                    'Total',
                    todos.length.toString(),
                    Icons.list_alt,
                    Colors.blue[400]!,
                  ),
                  _buildSummaryItem(
                    'Completed',
                    todos.where((t) => t.completed).length.toString(),
                    Icons.check_circle,
                    Colors.green[400]!,
                  ),
                  _buildSummaryItem(
                    'Pending',
                    todos.where((t) => !t.completed).length.toString(),
                    Icons.pending,
                    Colors.orange[400]!,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    String label,
    String count,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          count,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
