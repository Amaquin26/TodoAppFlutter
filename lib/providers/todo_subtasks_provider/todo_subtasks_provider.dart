import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';

final todoSubtasksServiceProvider = Provider<TodoSubtaskService>(
  (ref) => TodoSubtaskService(),
);
