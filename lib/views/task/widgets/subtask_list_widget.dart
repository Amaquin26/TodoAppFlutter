import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';
import 'package:todo_app_flutter/widgets/card/subtask_card/subtask_card_widget.dart';

class SubtaskListWidget extends StatefulWidget {
  final List<TodoSubtaskModel> todoSubtasks;

  const SubtaskListWidget({super.key, required this.todoSubtasks});

  @override
  State<SubtaskListWidget> createState() => _SubtaskListWidgetState();
}

class _SubtaskListWidgetState extends State<SubtaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Subtasks",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        ...widget.todoSubtasks.map(
          (todoSubtask) => SubtaskCardWidget(
            id: todoSubtask.id,
            todoTaskId: todoSubtask.todoTaskId,
            name: todoSubtask.name,
            isChecked: todoSubtask.isChecked,
          ),
        ),
      ],
    );
  }
}
