// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoSubtaskImpl _$$TodoSubtaskImplFromJson(Map<String, dynamic> json) =>
    _$TodoSubtaskImpl(
      id: (json['id'] as num).toInt(),
      todoTaskId: (json['todoTaskId'] as num).toInt(),
      name: json['name'] as String,
      isChecked: json['isChecked'] as bool,
    );

Map<String, dynamic> _$$TodoSubtaskImplToJson(_$TodoSubtaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todoTaskId': instance.todoTaskId,
      'name': instance.name,
      'isChecked': instance.isChecked,
    };
