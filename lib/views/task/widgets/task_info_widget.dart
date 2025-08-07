import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/widgets/modal/edit__todotask_modal/edit_todotask_modal.dart';

class TaskInfoWidget extends StatefulWidget {
  final int todoTaskId;
  final String title;
  final String? description;

  const TaskInfoWidget({
    super.key,
    required this.todoTaskId,
    required this.title,
    this.description,
  });

  @override
  State<TaskInfoWidget> createState() => _TaskInfoWidgetState();
}

class _TaskInfoWidgetState extends State<TaskInfoWidget> {
  final TodoTaskService _todoTaskService = TodoTaskService();
  late String _title;
  late String? _description;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _description = widget.description;
  }

  Future<void> _loadTodoTask() async {
    final todoTask = await _todoTaskService.getTodoTask(widget.todoTaskId);

    setState(() {
      _title = todoTask.title;
      _description = todoTask.description;
    });
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      // Proceed with delete or action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            _title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          trailing: SizedBox(
            width: 96, // enough space for two icons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      builder: ((context) {
                        return EditTodotaskModal(
                          todoTaskId: widget.todoTaskId,
                          title: widget.title,
                          description: widget.description,
                          loadTodoTask: _loadTodoTask,
                        );
                      }),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  onPressed: () => _showConfirmationDialog(context),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(_description ?? "", style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
