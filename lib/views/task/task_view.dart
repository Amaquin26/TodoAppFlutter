import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/views/task/widgets/subtask_list_widget.dart';
import 'package:todo_app_flutter/views/task/widgets/task_info_widget.dart';
import 'package:todo_app_flutter/widgets/templates/loader/page_loader/page_loader.dart';

class TaskView extends StatefulWidget {
  final int todoTaskId;

  const TaskView({super.key, required this.todoTaskId});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TodoTaskService _todoTaskService = TodoTaskService();
  late TodoTaskModel _todoTask;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _loadTodoTask();
  }

  Future<void> _loadTodoTask() async {
    try {
      final todoTask = await _todoTaskService.getTodoTask(widget.todoTaskId);
      setState(() {
        _todoTask = todoTask;
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
    return Scaffold(
      appBar: AppBar(),
      body: PageLoader(
        isLoading: _isLoading,
        child: PageView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskInfoWidget(
                      todoTaskId: _todoTask.id,
                      title: _todoTask.title,
                      description: _todoTask.description,
                    ),
                    Divider(),
                    SizedBox(height: 8.0),
                    SubtaskListWidget(todoTaskId: _todoTask.id),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
