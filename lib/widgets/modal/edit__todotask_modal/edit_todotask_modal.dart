import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/providers/todo_task_async_notifier/todo_task_async_notifier.dart';
import 'package:todo_app_flutter/providers/todo_tasks_async_notifier/todo_tasks_async_notifier.dart';
import 'package:todo_app_flutter/widgets/modal/base_bottom_sheet_modal.dart';
import 'package:go_router/go_router.dart';

class EditTodotaskModal extends ConsumerStatefulWidget {
  final int todoTaskId;
  final String title;
  final String? description;

  const EditTodotaskModal({
    super.key,
    required this.todoTaskId,
    required this.title,
    this.description,
  });

  @override
  ConsumerState<EditTodotaskModal> createState() => _EditTodotaskModalState();
}

class _EditTodotaskModalState extends ConsumerState<EditTodotaskModal> {
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

  Future<void> _updateTodoTask() async {
    final todoTaskNotifier = ref.read(
      todoTaskProvider(widget.todoTaskId).notifier,
    );
    final todoTasksNotifier = ref.read(todoTasksProvider.notifier);

    await todoTaskNotifier.updateTodoTask(
      id: widget.todoTaskId,
      title: _titleController.text,
      description: _descriptionController.text,
    );

    await todoTasksNotifier.refreshTodoTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheetModal(
      title: 'Edit Todo Task',
      children: [
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
                  context.pop();
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
                  await _updateTodoTask();

                  if (context.mounted) {
                    context.pop();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
