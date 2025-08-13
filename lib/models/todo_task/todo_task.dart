import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_task.freezed.dart';
part 'todo_task.g.dart';

@freezed
class TodoTask with _$TodoTask {
  const factory TodoTask({
    required int id,
    required String title,
    String? description,
  }) = _TodoTask;

  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);
}
