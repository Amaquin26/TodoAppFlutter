import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/card/base_card_widget.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String? description;

  const TaskCardWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Left Icon
            Padding(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.assignment,
                size: 32,
                color: Colors.blueAccent,
              ),
            ),

            const SizedBox(width: 16),

            // Right side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description ?? "",
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
