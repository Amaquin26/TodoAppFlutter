import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';

class AddTodoSubtaskModal extends StatefulWidget {
  final int todoTaskId;
  final VoidCallback onSubtaskAdded;

  const AddTodoSubtaskModal({
    super.key,
    required this.todoTaskId,
    required this.onSubtaskAdded,
  });

  @override
  State<AddTodoSubtaskModal> createState() => _AddTodoSubtaskModalState();
}

class _AddTodoSubtaskModalState extends State<AddTodoSubtaskModal> {
  final TodoSubtaskService _todoTaskService = TodoSubtaskService();

  final TextEditingController _nameController = TextEditingController();

  Future<int> _addTodoSubtask() async {
    final newTodoTaskId = await _todoTaskService.addTodoSubtask(
      todoTaskId: widget.todoTaskId,
      name: _nameController.text,
    );

    // Clear the text fields
    _nameController.clear();

    return newTodoTaskId;
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
            'Add New Todo Subtask',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(height: 16.0),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
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
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                    ), // 👈 Effective padding
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  onPressed: () async {
                    await _addTodoSubtask();
                    if (mounted) {
                      Navigator.pop(context);
                    }
                    widget.onSubtaskAdded();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                    ), // 👈 Effective padding
                    child: Text('Add Subtask'),
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
