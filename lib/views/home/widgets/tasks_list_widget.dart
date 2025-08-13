import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todo_task/todo_task.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';
import 'package:todo_app_flutter/widgets/card/task_card/task_card_widget.dart';

class TasksListWidget extends StatefulWidget {
  final List<TodoTask> todoTasks;

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
}
