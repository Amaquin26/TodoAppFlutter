import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/providers/todo_tasks_async_notifier/todo_tasks_async_notifier.dart';
import 'package:todo_app_flutter/views/task/task_view.dart';
import 'package:todo_app_flutter/widgets/modal/base_bottom_sheet_modal.dart';

class AddTodoTaskModal extends ConsumerStatefulWidget {
  const AddTodoTaskModal({super.key});

  @override
  ConsumerState<AddTodoTaskModal> createState() => _AddTodoTaskModalState();
}

class _AddTodoTaskModalState extends ConsumerState<AddTodoTaskModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<int> _addTodoTask() async {
    final notifier = ref.read(todoTasksProvider.notifier);

    final newTodoTaskId = await notifier.addTodoTask(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    return newTodoTaskId;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheetModal(
      title: 'Add Todo Task',
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
                  final newTodoTaskId = await _addTodoTask();

                  // Clear the text fields
                  _titleController.clear();
                  _descriptionController.clear();

                  if (context.mounted) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TaskView(todoTaskId: newTodoTaskId),
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Add Task'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
