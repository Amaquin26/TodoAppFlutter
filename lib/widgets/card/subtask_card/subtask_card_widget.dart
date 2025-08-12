import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/providers/todo_subtasks_async_notifier/todo_subtasks_async_notifier.dart';
import 'package:todo_app_flutter/widgets/card/base_card_widget.dart';
import 'package:todo_app_flutter/widgets/dialog/delete_dialog/delete_dialog.dart';
import 'package:todo_app_flutter/widgets/modal/bottom_modal/bottom_modal.dart';
import 'package:go_router/go_router.dart';

class SubtaskCardWidget extends ConsumerStatefulWidget {
  final int id;
  final int todoTaskId;
  final String name;
  final bool isChecked;

  const SubtaskCardWidget({
    super.key,
    required this.id,
    required this.todoTaskId,
    required this.name,
    required this.isChecked,
  });

  @override
  ConsumerState<SubtaskCardWidget> createState() => _SubtaskCardWidgetState();
}

class _SubtaskCardWidgetState extends ConsumerState<SubtaskCardWidget> {
  late String _name;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _isChecked = widget.isChecked;
  }

  Future<void> _toggleCheckStatus(bool? value) async {
    final todoSubtasksNotifier = ref.read(
      todoSubtasksProvider(widget.todoTaskId).notifier,
    );

    try {
      final newStatus = await todoSubtasksNotifier.toggleTodoSubtaskCheckStatus(
        widget.id,
      );
      setState(() {
        _isChecked = newStatus;
      });
    } catch (e) {}
  }

  Future<void> _updateTodoSubtask(String name) async {
    final todoSubtasksNotifier = ref.read(
      todoSubtasksProvider(widget.todoTaskId).notifier,
    );

    try {
      await todoSubtasksNotifier.updateTodoSubtask(
        id: widget.id,
        todoTaskId: widget.todoTaskId,
        name: name,
      );

      debugPrint(name);
    } catch (e) {}
  }

  Future<void> _deleteTodoSubtask() async {
    final todoSubtasksNotifier = ref.read(
      todoSubtasksProvider(widget.todoTaskId).notifier,
    );

    await todoSubtasksNotifier.deleteTodoSubtask(
      id: widget.id,
      todoTaskId: widget.todoTaskId,
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(
          title: 'Delete Todo Subtask',
          content: 'Are you sure you want to delete this subtask?',
          onPressedCancel: () => context.pop(),
          onPressedDelete: () async => {
            await _deleteTodoSubtask(),

            if (context.mounted) context.pop(),
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: Text(_name),
              value: _isChecked,
              onChanged: _toggleCheckStatus,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () => _showDeleteConfirmationDialog(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Delete'),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () => {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        builder: ((context) {
                          return BottomModal(
                            title: 'Edit Todo Subtask',
                            textInputTitle: 'Name',
                            onPressButtonTitle: 'Save',
                            onPress: (textValue) async => {
                              await _updateTodoSubtask(textValue),

                              setState(() {
                                _name = textValue;
                              }),

                              if (context.mounted) {context.pop()},
                            },
                            initTextValue: _name,
                          );
                        }),
                      ),
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Update'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
