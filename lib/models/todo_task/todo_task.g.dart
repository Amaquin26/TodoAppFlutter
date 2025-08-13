// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoTaskImpl _$$TodoTaskImplFromJson(Map<String, dynamic> json) =>
    _$TodoTaskImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$TodoTaskImplToJson(_$TodoTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
