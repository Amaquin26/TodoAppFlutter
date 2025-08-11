import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';
import 'package:todo_app_flutter/providers/todo_subtasks_provider/todo_subtasks_provider.dart';

class TodoSubTasksNotifier
    extends FamilyAsyncNotifier<List<TodoSubtaskModel>, int> {
  @override
  FutureOr<List<TodoSubtaskModel>> build(int todoTaskId) async {
    final service = ref.read(todoSubtasksServiceProvider);
    return service.getTodoSubtasksByTaskId(todoTaskId);
  }

  Future<int> addTodoSubtask({
    required int todoTaskId,
    required String name,
  }) async {
    final service = ref.read(todoSubtasksServiceProvider);
    final id = await service.addTodoSubtask(todoTaskId: todoTaskId, name: name);

    await refreshTodoSubtasks(todoTaskId);
    return id;
  }

  Future<void> updateTodoSubtask({
    required int id,
    required int todoTaskId,
    required String name,
  }) async {
    final service = ref.read(todoSubtasksServiceProvider);
    await service.updateTodoSubtask(id: id, name: name);
    await refreshTodoSubtasks(todoTaskId);
  }

  Future<void> deleteTodoSubtask({
    required int id,
    required int todoTaskId,
  }) async {
    final service = ref.read(todoSubtasksServiceProvider);
    await service.deleteTodoSubtask(id);
    await refreshTodoSubtasks(todoTaskId);
  }

  Future<bool> toggleTodoSubtaskCheckStatus(int id) async {
    final service = ref.read(todoSubtasksServiceProvider);
    final bool newCheckStatus = await service.toggleTodoSubtaskCheckStatus(id);
    return newCheckStatus;
  }

  Future<void> refreshTodoSubtasks(int todoTaskId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(todoSubtasksServiceProvider);
      return service.getTodoSubtasksByTaskId(todoTaskId);
    });
  }
}

final todoSubtasksProvider =
    AsyncNotifierProvider.family<
      TodoSubTasksNotifier,
      List<TodoSubtaskModel>,
      int
    >(TodoSubTasksNotifier.new);
