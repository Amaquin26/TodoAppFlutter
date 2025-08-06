import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/card/subtask_card/subtask_card_widget.dart';

class SubtaskListWidget extends StatefulWidget {
  const SubtaskListWidget({super.key});

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
        ...List.generate(
          15,
          (index) => SubtaskCardWidget(name: "Subtask  ${index + 1}"),
        ),
      ],
    );
  }
}
