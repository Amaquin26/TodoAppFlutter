import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/providers/todo_tasks_provider/todo_tasks_provider.dart';

class TodoTaskNotifier extends FamilyAsyncNotifier<TodoTaskModel, int> {
  @override
  Future<TodoTaskModel> build(int id) async {
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

final todoTaskProvider =
    AsyncNotifierProvider.family<TodoTaskNotifier, TodoTaskModel, int>(
      TodoTaskNotifier.new,
    );
