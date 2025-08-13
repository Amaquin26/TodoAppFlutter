import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_flutter/models/todo_task/todo_task.dart';
import 'package:todo_app_flutter/providers/todo_tasks_provider/todo_tasks_provider.dart';

part 'todo_task_async_notifier.g.dart';

@riverpod
class TodoTaskNotifier extends _$TodoTaskNotifier {
  @override
  Future<TodoTask> build(int id) async {
    final service = ref.read(todoTasksServiceProvider);
    return service.getTodoTask(id);
  }

  Future<void> updateTodoTask({
    required int id,
    required String title,
    String? description,
  }) async {
    final service = ref.read(todoTasksServiceProvider);
    await service.updateTodoTask(
      id: id,
      title: title,
      description: description,
    );
    await refreshTodoTask(id);
  }

  Future<void> refreshTodoTask(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(todoTasksServiceProvider);
      return service.getTodoTask(id);
    });
  }
}
