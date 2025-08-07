import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';

class TodoTaskService extends BaseApiService {
  TodoTaskService() : super('http://localhost:5000/api/TodoTask');

  Future<List<TodoTaskModel>> getTodoTasks() async {
    final response = await get('');
    return (response as List)
        .map((json) => TodoTaskModel.fromJson(json))
        .toList();
  }

  Future<TodoTaskModel> getTodoTask(int id) async {
    final response = await get('/$id');
    return TodoTaskModel.fromJson(response);
  }

  Future<int> addTodoTask({required String title, String? description}) async {
    final response = await post('', {
      'title': title,
      if (description != null) 'description': description,
    });

    return response as int;
  }

  Future<int> updateTodoTask({
    required int id,
    required String name,
    String? description,
  }) async {
    final response = await put('', {
      'id': id,
      'name': name,
      if (description != null) 'description': description,
    });

    return response as int;
  }

  Future<void> deleteTodoTask(int id) async {
    await delete('/$id');
  }
}
