import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';
import 'package:todo_app_flutter/widgets/card/subtask_card/subtask_card_widget.dart';
import 'package:todo_app_flutter/widgets/templates/loader/page_loader/page_loader.dart';

class SubtaskListWidget extends StatefulWidget {
  final int todoTaskId;

  const SubtaskListWidget({super.key, required this.todoTaskId});

  @override
  State<SubtaskListWidget> createState() => _SubtaskListWidgetState();
}

class _SubtaskListWidgetState extends State<SubtaskListWidget> {
  final TodoSubtaskService _todoSubtaskService = TodoSubtaskService();
  late List<TodoSubtaskModel> _todoSubtasks = [];
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _loadTodoSubtasks();
  }

  Future<void> _loadTodoSubtasks() async {
    try {
      final todoSubtasks = await _todoSubtaskService.getTodoSubtasksByTaskId(
        widget.todoTaskId,
      );
      setState(() {
        _todoSubtasks = todoSubtasks;
        _isLoading = false;
        _isError = false;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLoader(
      isLoading: _isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Subtasks",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          ..._todoSubtasks.map(
            (todoSubtask) => SubtaskCardWidget(
              id: todoSubtask.id,
              name: todoSubtask.name,
              isChecked: todoSubtask.isChecked,
            ),
          ),
        ],
      ),
    );
  }
}
