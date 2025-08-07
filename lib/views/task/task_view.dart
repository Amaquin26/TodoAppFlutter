import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/views/task/widgets/subtask_list_widget.dart';
import 'package:todo_app_flutter/views/task/widgets/task_info_widget.dart';
import 'package:todo_app_flutter/widgets/modal/add_todosubtask_modal/add_todosubtask_modal.dart';
import 'package:todo_app_flutter/widgets/templates/loader/page_loader/page_loader.dart';

class TaskView extends StatefulWidget {
  final int todoTaskId;

  const TaskView({super.key, required this.todoTaskId});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TodoTaskService _todoTaskService = TodoTaskService();
  final TodoSubtaskService _todoSubtaskService = TodoSubtaskService();

  late TodoTaskModel _todoTask;
  bool _isLoading = true;
  bool _isError = false;

  Key _subtaskListKey = UniqueKey();

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

  Future<List<TodoSubtaskModel>> _loadTodoSubtasks() async {
    final todoSubtasks = await _todoSubtaskService.getTodoSubtasksByTaskId(
      widget.todoTaskId,
    );

    return todoSubtasks;
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
                    SubtaskListWidget(
                      key: _subtaskListKey,
                      todoTaskId: _todoTask.id,
                      loadSubtasks: _loadTodoSubtasks,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
              return AddTodoSubtaskModal(
                todoTaskId: widget.todoTaskId,
                onSubtaskAdded: () async {
                  await _loadTodoSubtasks();
                  setState(() {
                    _subtaskListKey = UniqueKey();
                  });
                },
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
