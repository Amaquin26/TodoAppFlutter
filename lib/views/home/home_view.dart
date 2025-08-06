import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';
import 'package:todo_app_flutter/widgets/card/task_card/task_card_widget.dart';
import 'package:todo_app_flutter/widgets/templates/loader/page_loader/page_loader.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TodoTaskService _todoTaskService = TodoTaskService();
  List<TodoTaskModel> _todoTasks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTodoTasks();
  }

  Future<void> _loadTodoTasks() async {
    try {
      final todoTasks = await _todoTaskService.getTodoTasks();
      setState(() {
        _todoTasks = todoTasks;
        _isLoading = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageLoader(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ..._todoTasks.map(
                (task) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskView(todoTaskId: task.id),
                      ),
                    );
                  },
                  child: TaskCardWidget(
                    title: task.title,
                    description: task.description,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
