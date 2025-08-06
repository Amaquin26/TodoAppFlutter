import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';

class TodoTaskService extends BaseApiService {
  TodoTaskService() : super('http://10.0.2.2:5000/api/TodoTask');

  Future<List<TodoTaskModel>> getTodoTasks() async {
    final response = await get('');
    debugPrint('Raw response: $response');
    return (response as List)
        .map((json) => TodoTaskModel.fromJson(json))
        .toList();
  }
}
