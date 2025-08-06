import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';

class TodoSubtaskService extends BaseApiService {
  TodoSubtaskService() : super('http://10.0.2.2:5000/api/TodoSubtask');

  Future<List<TodoSubtaskModel>> getTodoSubtasksByTaskId(int todoTaskId) async {
    final response = await get('/task/$todoTaskId');
    return (response as List)
        .map((json) => TodoSubtaskModel.fromJson(json))
        .toList();
  }

  Future<bool> toggleTodoSubtaskCheckStatus(int todoTaskId) async {
    final response = await patch('/$todoTaskId', null);
    return response as bool;
  }
}
