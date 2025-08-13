import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/providers/todo_subtasks_notifier/todo_subtasks_notifier.dart';
import 'package:todo_app_flutter/providers/todo_task_async_notifier/todo_task_async_notifier.dart';
import 'package:todo_app_flutter/providers/todo_tasks_async_notifier/todo_tasks_async_notifier.dart';
import 'package:todo_app_flutter/views/task/widgets/subtask_list_widget.dart';
import 'package:todo_app_flutter/views/task/widgets/task_info_widget.dart';
import 'package:todo_app_flutter/widgets/app_bar/chevron_app_bar/chevron_app_bar.dart';
import 'package:todo_app_flutter/widgets/dialog/delete_dialog/delete_dialog.dart';
import 'package:todo_app_flutter/widgets/modal/add_todosubtask_modal/add_todosubtask_modal.dart';

class TaskView extends ConsumerStatefulWidget {
  final int todoTaskId;
  const TaskView({super.key, required this.todoTaskId});

  @override
  ConsumerState<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends ConsumerState<TaskView> {
  _deleteTodoTask() async {
    final todoTasksNotifier = ref.read(todoTasksProvider.notifier);

    await todoTasksNotifier.deleteTodoTask(widget.todoTaskId);
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
            await _deleteTodoTask(),

            if (context.mounted)
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
                  Consumer(
                    builder: (context, builder, _) {
                      final todoTaskAsync = ref.watch(
                        todoTaskNotifierProvider(widget.todoTaskId),
                      );

                      return todoTaskAsync.when(
                        data: (task) => TaskInfoWidget(
                          todoTaskId: task.id,
                          title: task.title,
                          description: task.description,
                        ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) => Text('Error: $error'),
                      );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 8.0),
                  Consumer(
                    builder: (context, builder, _) {
                      final todoSubtasksAsync = ref.watch(
                        todoSubTasksNotifierProvider(widget.todoTaskId),
                      );

                      return todoSubtasksAsync.when(
                        data: (todoSubtasks) =>
                            SubtaskListWidget(todoSubtasks: todoSubtasks),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) => Text('Error: $error'),
                      );
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
              return AddTodoSubtaskModal(todoTaskId: widget.todoTaskId);
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
