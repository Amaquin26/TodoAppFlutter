import 'package:flutter/material.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/widgets/card/task_card/task_card_widget.dart';

class TasksListWidget extends StatefulWidget {
  final List<TodoTaskModel> todoTasks;

  const TasksListWidget({super.key, required this.todoTasks});

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.todoTasks.map(
          (task) => GestureDetector(
            onTap: () {
              rootNavigatorKey.currentContext!.pushNamed(
                'task',
                pathParameters: {'id': task.id.toString()},
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
}
