import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';

class EditTodotaskModal extends StatefulWidget {
  final int todoTaskId;
  final String title;
  final String? description;
  final Function loadTodoTask;

  const EditTodotaskModal({
    super.key,
    required this.todoTaskId,
    required this.title,
    this.description,
    required this.loadTodoTask,
  });

  @override
  State<EditTodotaskModal> createState() => _EditTodotaskModalState();
}

class _EditTodotaskModalState extends State<EditTodotaskModal> {
  final TodoTaskService _todoTaskService = TodoTaskService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    if (widget.description != null) {
      _descriptionController.text = widget.description!;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Todo Task',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(height: 16.0),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Cancel'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () async {
                    await _todoTaskService.updateTodoTask(
                      id: widget.todoTaskId,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );

                    widget.loadTodoTask();

                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Edit Task'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
