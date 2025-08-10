import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';
import 'package:todo_app_flutter/widgets/card/base_card_widget.dart';
import 'package:todo_app_flutter/widgets/dialog/delete_dialog/delete_dialog.dart';
import 'package:todo_app_flutter/widgets/modal/bottom_modal/bottom_modal.dart';

class SubtaskCardWidget extends StatefulWidget {
  final int id;
  final int todoTaskId;
  final String name;
  final bool isChecked;
  final VoidCallback loadTodoSubtasks;

  const SubtaskCardWidget({
    super.key,
    required this.id,
    required this.todoTaskId,
    required this.name,
    required this.isChecked,
    required this.loadTodoSubtasks,
  });

  @override
  State<SubtaskCardWidget> createState() => _SubtaskCardWidgetState();
}

class _SubtaskCardWidgetState extends State<SubtaskCardWidget> {
  final TodoSubtaskService _todoSubtaskService = TodoSubtaskService();

  late String _name;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _isChecked = widget.isChecked;
  }

  Future<void> _toggleCheckStatus(bool? value) async {
    try {
      final newStatus = await _todoSubtaskService.toggleTodoSubtaskCheckStatus(
        widget.id,
      );
      setState(() {
        _isChecked = newStatus;
      });
    } catch (e) {}
  }

  Future<void> _updateTodoSubtask(String name) async {
    try {
      await _todoSubtaskService.updateTodoSubtask(id: widget.id, name: name);

      debugPrint(name);
    } catch (e) {}
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(
          title: 'Delete Todo Subtask',
          content: 'Are you sure you want to delete this subtask?',
          onPressedCancel: () => Navigator.of(context).pop(false),
          onPressedDelete: () async => {
            await _todoSubtaskService.deleteTodoSubtask(widget.id),

            if (mounted) {Navigator.pop(context)},

            widget.loadTodoSubtasks(),
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

                              if (mounted) {Navigator.pop(context)},
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
