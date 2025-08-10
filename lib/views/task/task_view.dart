import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/views/task/widgets/subtask_list_widget.dart';
import 'package:todo_app_flutter/views/task/widgets/task_info_widget.dart';
import 'package:todo_app_flutter/widgets/app_bar/chevron_app_bar/chevron_app_bar.dart';
import 'package:todo_app_flutter/widgets/dialog/delete_dialog/delete_dialog.dart';
import 'package:todo_app_flutter/widgets/modal/add_todosubtask_modal/add_todosubtask_modal.dart';

class TaskView extends StatefulWidget {
  final int todoTaskId;
  final VoidCallback loadTodTasks;

  const TaskView({
    super.key,
    required this.todoTaskId,
    required this.loadTodTasks,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TodoTaskService _todoTaskService = TodoTaskService();
  final TodoSubtaskService _todoSubtaskService = TodoSubtaskService();

  late Future<TodoTaskModel> _todoTask;
  late Future<List<TodoSubtaskModel>> _todoSubtask;

  @override
  void initState() {
    super.initState();
    _todoTask = _todoTaskService.getTodoTask(widget.todoTaskId);
    _todoSubtask = _todoSubtaskService.getTodoSubtasksByTaskId(
      widget.todoTaskId,
    );
  }

  _loadTodoSubtasks() {
    setState(() {
      _todoSubtask = _todoSubtaskService.getTodoSubtasksByTaskId(
        widget.todoTaskId,
      );
    });
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(
          title: 'Delete Todo Task',
          content: 'Are you sure you want to delete this task?',
          onPressedCancel: () => Navigator.of(context).pop(false),
          onPressedDelete: () async => {
            await _todoTaskService.deleteTodoTask(widget.todoTaskId),

            if (mounted)
              {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                  (Route<dynamic> route) => false,
                ),
              },
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChevronAppBar(
        title: 'Task Viewing',
        actions: [
          IconButton(
            onPressed: () => _showDeleteConfirmationDialog(context),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
      body: PageView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: _todoTask,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final TodoTaskModel todoTask = snapshot.requireData;

                        return TaskInfoWidget(
                          todoTaskId: todoTask.id,
                          title: todoTask.title,
                          description: todoTask.description,
                          loadTodTasks: widget.loadTodTasks,
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                  Divider(),
                  SizedBox(height: 8.0),
                  FutureBuilder(
                    future: _todoSubtask,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<TodoSubtaskModel> todoSubtasks =
                            snapshot.requireData;

                        return SubtaskListWidget(
                          todoSubtasks: todoSubtasks,
                          loadTodoSubtasks: _loadTodoSubtasks,
                        );
                      }

                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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
                onSubtaskAdded: _loadTodoSubtasks,
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
