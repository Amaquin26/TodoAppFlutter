import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/providers/todo_subtasks_async_notifier/todo_subtasks_async_notifier.dart';
import 'package:todo_app_flutter/widgets/modal/base_bottom_sheet_modal.dart';

class AddTodoSubtaskModal extends ConsumerStatefulWidget {
  final int todoTaskId;

  const AddTodoSubtaskModal({super.key, required this.todoTaskId});

  @override
  ConsumerState<AddTodoSubtaskModal> createState() =>
      _AddTodoSubtaskModalState();
}

class _AddTodoSubtaskModalState extends ConsumerState<AddTodoSubtaskModal> {
  final TextEditingController _nameController = TextEditingController();

  Future<int> _addTodoSubtask() async {
    final notifier = ref.read(todoSubtasksProvider(widget.todoTaskId).notifier);

    final newTodoTaskId = await notifier.addTodoSubtask(
      todoTaskId: widget.todoTaskId,
      name: _nameController.text,
    );

    return newTodoTaskId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheetModal(
      title: 'Add New Todo Subtask',
      children: [
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
                  await _addTodoSubtask();

                  // Clear the text fields
                  _nameController.clear();

                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Add Subtask'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
