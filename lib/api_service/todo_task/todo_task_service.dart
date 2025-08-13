import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/models/todo_task/todo_task.dart';
import '../../config/config.dart';

class TodoTaskService extends BaseApiService {
  TodoTaskService() : super('$localhostBaseApiUrl/TodoTask');

  Future<List<TodoTask>> getTodoTasks() async {
    final response = await get('');
    return (response as List).map((json) => TodoTask.fromJson(json)).toList();
  }

  Future<TodoTask> getTodoTask(int id) async {
    final response = await get('/$id');
    return TodoTask.fromJson(response);
  }

  Future<int> addTodoTask({required String title, String? description}) async {
    final response = await post('', {
      'title': title,
      if (description != null) 'description': description,
    });

    return response as int;
  }

  Future<void> updateTodoTask({
    required int id,
    required String title,
    String? description,
  }) async {
    await put('', {
      'id': id,
      'title': title,
      if (description != null) 'description': description,
    });
  }

  Future<void> deleteTodoTask(int id) async {
    await delete('/$id');
  }
}
