import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/api_service/todo_task/todo_task_service.dart';
import 'package:todo_app_flutter/models/todotask_model.dart';

import 'todo_task_service_test.mocks.dart';

@GenerateMocks([BaseApiService])
void main() {
  late MockBaseApiService mockBaseApiService;
  late TodoTaskService todoTaskService;

  setUp(() {
    mockBaseApiService = MockBaseApiService();
    todoTaskService = _TestableTodoTaskService(mockBaseApiService);
  });

  group('TodoTaskService', () {
    test('should return a list of Todo Task', () async {
      // Arrange
      final List<TodoTaskModel> mockTodoTaskList = [
        TodoTaskModel(id: 1, title: 'Task 1', description: 'Desc 1'),
        TodoTaskModel(id: 2, title: 'Task 2', description: 'Desc 2'),
      ];

      when(mockBaseApiService.get('')).thenAnswer(
        (_) async => mockTodoTaskList.map((e) => e.toJson()).toList(),
      );

      // Act
      final result = await todoTaskService.getTodoTasks();

      // Assert
      expect(result, isA<List<TodoTaskModel>>());
      expect(result.length, 2);
      expect(result[0].title, 'Task 1');
    });

    test('should return a Todo Task', () async {
      // Arrange

      final mockTodoTaskId = 1;
      final TodoTaskModel mockTodoTask = TodoTaskModel(
        id: mockTodoTaskId,
        title: 'Task 1',
        description: 'Desc 1',
      );

      when(
        mockBaseApiService.get('/$mockTodoTaskId'),
      ).thenAnswer((_) async => mockTodoTask.toJson());

      // Act
      final result = await todoTaskService.getTodoTask(mockTodoTaskId);

      // Assert
      expect(result, isA<TodoTaskModel>());
      expect(result.id, mockTodoTaskId);
      expect(result.title, 'Task 1');
      expect(result.description, 'Desc 1');
    });

    test('should add a Todo Task', () async {
      // Arrange
      final mockTodoTaskId = 99;
      final mockTodoTaskJson = {
        'title': 'Task $mockTodoTaskId',
        'description': 'Desc 1',
      };

      when(
        mockBaseApiService.post('', mockTodoTaskJson),
      ).thenAnswer((_) async => mockTodoTaskId);

      // Act
      final result = await todoTaskService.addTodoTask(
        title: mockTodoTaskJson['title']!,
        description: mockTodoTaskJson['description'],
      );

      // Assert
      expect(result, isA<int>());
      expect(result, mockTodoTaskId);
    });

    test('should update Todo Task', () async {
      // Arrange
      final TodoTaskModel mockUpdatedTodoTask = TodoTaskModel(
        id: 99,
        title: 'Updated Task',
        description: 'Updated Desc',
      );

      when(
        mockBaseApiService.put('', mockUpdatedTodoTask.toJson()),
      ).thenAnswer((_) async => null);

      // Act
      await todoTaskService.updateTodoTask(
        id: mockUpdatedTodoTask.id,
        title: mockUpdatedTodoTask.title,
        description: mockUpdatedTodoTask.description,
      );

      // Assert
      verify(
        mockBaseApiService.put('', {
          'id': mockUpdatedTodoTask.id,
          'title': mockUpdatedTodoTask.title,
          'description': mockUpdatedTodoTask.description,
        }),
      ).called(1);
    });

    test('should delete Todo Task', () async {
      // Arrange
      final mockTodoTaskId = 99;

      when(
        mockBaseApiService.delete('/$mockTodoTaskId'),
      ).thenAnswer((_) async => null);

      // Act
      await todoTaskService.deleteTodoTask(mockTodoTaskId);

      // Assert
      verify(mockBaseApiService.delete('/$mockTodoTaskId')).called(1);
    });
  });
}

class _TestableTodoTaskService extends TodoTaskService {
  final BaseApiService mockBase;
  _TestableTodoTaskService(this.mockBase);

  @override
  Future<dynamic> get(String endpoint) => mockBase.get(endpoint);

  @override
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) =>
      mockBase.post(endpoint, data);

  @override
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) =>
      mockBase.put(endpoint, data);

  @override
  Future<dynamic> delete(String endpoint) => mockBase.delete(endpoint);
}
