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
          trailing: IconButton(
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
        ),
        const SizedBox(height: 8),
        Text(_description ?? "", style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
