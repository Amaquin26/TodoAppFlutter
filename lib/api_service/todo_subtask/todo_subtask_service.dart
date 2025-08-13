import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/models/todo_subtask/todo_subtask.dart';
import '../../config/config.dart';

class TodoSubtaskService extends BaseApiService {
  TodoSubtaskService() : super('$localhostBaseApiUrl/TodoSubtask');

  Future<List<TodoSubtask>> getTodoSubtasksByTaskId(int todoTaskId) async {
    final response = await get('/task/$todoTaskId');
    return (response as List)
        .map((json) => TodoSubtask.fromJson(json))
        .toList();
  }

  Future<int> addTodoSubtask({
    required int todoTaskId,
    required String name,
  }) async {
    final response = await post('', {'todoTaskId': todoTaskId, 'name': name});

    return response as int;
  }

  Future<int> updateTodoSubtask({required int id, required String name}) async {
    final response = await put('', {'id': id, 'name': name});

    return response as int;
  }

  Future<void> deleteTodoSubtask(int id) async {
    await delete('/$id');
  }

  Future<bool> toggleTodoSubtaskCheckStatus(int todoSubtaskId) async {
    final response = await patch('/$todoSubtaskId', null);
    return response as bool;
  }
}
