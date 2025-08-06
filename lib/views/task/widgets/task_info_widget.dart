import 'package:flutter/material.dart';

class TaskInfoWidget extends StatefulWidget {
  final int taskId;
  final String title;
  final String? description;

  const TaskInfoWidget({
    super.key,
    required this.taskId,
    required this.title,
    this.description,
  });

  @override
  State<TaskInfoWidget> createState() => _TaskInfoWidgetState();
}

class _TaskInfoWidgetState extends State<TaskInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(widget.description ?? "", style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
