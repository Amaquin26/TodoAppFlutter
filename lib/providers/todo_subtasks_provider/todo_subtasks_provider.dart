import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';

part 'todo_subtasks_provider.g.dart';

@riverpod
TodoSubtaskService todoSubtasksService(Ref ref) {
  return TodoSubtaskService();
}
