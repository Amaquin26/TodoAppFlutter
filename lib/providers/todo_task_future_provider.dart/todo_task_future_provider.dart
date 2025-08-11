import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';
import 'package:todo_app_flutter/providers/todo_tasks_provider/todo_tasks_provider.dart';

final todoTaskFutureProvider = FutureProvider.family<TodoTaskModel, int>((
  ref,
  id,
) async {
  final service = ref.watch(todoTasksServiceProvider);
  return await service.getTodoTask(id);
});
