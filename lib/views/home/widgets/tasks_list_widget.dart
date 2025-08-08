import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';
import 'package:todo_app_flutter/widgets/card/task_card/task_card_widget.dart';

class TasksListWidget extends StatefulWidget {
  const TasksListWidget({super.key});

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  final TodoTaskService _todoTaskService = TodoTaskService();

  late Future<List<TodoTaskModel>> _todoTasks;

  @override
  void initState() {
    super.initState();
    _todoTasks = _todoTaskService.getTodoTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _todoTasks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<TodoTaskModel> todoTasks = snapshot.requireData;

          return Column(
            children: [
              ...todoTasks.map(
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
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
