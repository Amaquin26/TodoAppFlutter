import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_subtask.freezed.dart';
part 'todo_subtask.g.dart';

@freezed
class TodoSubtask with _$TodoSubtask {
  const factory TodoSubtask({
    required int id,
    required int todoTaskId,
    required String name,
    required bool isChecked,
  }) = _TodoSubtask;

  factory TodoSubtask.fromJson(Map<String, dynamic> json) =>
      _$TodoSubtaskFromJson(json);
}
