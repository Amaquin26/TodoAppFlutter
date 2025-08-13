import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';

part 'todo_tasks_provider.g.dart';

@riverpod
TodoTaskService todoTasksService(Ref ref) {
  return TodoTaskService();
}
