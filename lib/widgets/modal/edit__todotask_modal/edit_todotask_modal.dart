import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/providers/todo_task_future_provider.dart/todo_task_future_provider.dart';
import 'package:todo_app_flutter/providers/todo_tasks_async_notifier/todo_tasks_async_notifier.dart';
import 'package:todo_app_flutter/widgets/modal/base_bottom_sheet_modal.dart';

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
    final notifier = ref.read(todoTasksProvider.notifier);

    await notifier.updateTodoTask(
      id: widget.todoTaskId,
      title: _titleController.text,
      description: _descriptionController.text,
    );

    ref.invalidate(todoTaskFutureProvider(widget.todoTaskId));
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
                  await _updateTodoTask();

                  if (mounted) {
                    Navigator.pop(context);
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
