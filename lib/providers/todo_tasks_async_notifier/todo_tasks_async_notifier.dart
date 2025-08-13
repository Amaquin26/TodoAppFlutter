import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/todo_task/todo_task.dart';
import 'package:todo_app_flutter/providers/todo_tasks_provider/todo_tasks_provider.dart';

class TodoTasksNotifier extends AsyncNotifier<List<TodoTask>> {
  @override
  Future<List<TodoTask>> build() async {
    final service = ref.read(todoTasksServiceProvider);
    return service.getTodoTasks();
  }

  Future<TodoTask> getTodoTask(int id) async {
    final service = ref.read(todoTasksServiceProvider);
    return service.getTodoTask(id);
  }

  Future<int> addTodoTask({required String title, String? description}) async {
    final service = ref.read(todoTasksServiceProvider);
    final id = await service.addTodoTask(
      title: title,
      description: description,
    );
    await refreshTodoTasks();
    return id;
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
    await refreshTodoTasks();
  }

  Future<void> deleteTodoTask(int id) async {
    final service = ref.read(todoTasksServiceProvider);
    await service.deleteTodoTask(id);
    await refreshTodoTasks();
  }

  Future<void> refreshTodoTasks() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(todoTasksServiceProvider);
      return service.getTodoTasks();
    });
  }
}

final todoTasksProvider =
    AsyncNotifierProvider<TodoTasksNotifier, List<TodoTask>>(
      TodoTasksNotifier.new,
    );
