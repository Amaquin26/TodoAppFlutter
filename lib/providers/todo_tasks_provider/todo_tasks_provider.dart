import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';

final todoTasksServiceProvider = Provider<TodoTaskService>(
  (ref) => TodoTaskService(),
);
