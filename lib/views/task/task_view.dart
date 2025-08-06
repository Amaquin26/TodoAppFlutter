import 'package:flutter/material.dart';
import 'package:todo_app_flutter/views/task/widgets/subtask_list_widget.dart';
import 'package:todo_app_flutter/views/task/widgets/task_info_widget.dart';

class TaskView extends StatelessWidget {
  final int taskId;

  const TaskView({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskInfoWidget(
                    taskId: taskId,
                    title: "Task View $taskId",
                    description: "You are viewing task.",
                  ),
                  Divider(),
                  SizedBox(height: 8.0),
                  SubtaskListWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
