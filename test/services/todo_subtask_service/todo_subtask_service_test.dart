import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app_flutter/api_service/base_api_service.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';
import 'package:todo_app_flutter/models/todosubtask_model.dart';

import 'todo_subtask_service_test.mocks.dart';

@GenerateMocks([BaseApiService])
void main() {
  late MockBaseApiService mockBaseApiService;
  late TodoSubtaskService todoSubtaskService;

  setUp(() {
    mockBaseApiService = MockBaseApiService();
    todoSubtaskService = _TestableTodoSubtaskService(mockBaseApiService);
  });

  group('TodoSubtaskService', () {
    test('should return a list of Todo Subtask', () async {
      // Arrange
      final mockJsonTodoTaskId = 1;
      final List<TodoSubtaskModel> mockTodoSubtaskList = [
        TodoSubtaskModel(
          id: 1,
          todoTaskId: mockJsonTodoTaskId,
          name: 'Subtask 1',
          isChecked: false,
        ),
        TodoSubtaskModel(
          id: 2,
          todoTaskId: mockJsonTodoTaskId,
          name: 'Subtask 2',
          isChecked: false,
        ),
      ];

      when(mockBaseApiService.get('/task/$mockJsonTodoTaskId')).thenAnswer(
        (_) async => mockTodoSubtaskList.map((e) => e.toJson()).toList(),
      );

      // Act
      final result = await todoSubtaskService.getTodoSubtasksByTaskId(
        mockJsonTodoTaskId,
      );

      // Assert
      expect(result, isA<List<TodoSubtaskModel>>());
      expect(result.length, 2);
      expect(result[0].name, 'Subtask 1');
    });

    test('should add a Todo Subtask', () async {
      // Arrange
      final mockJsonTodoTaskId = 1;
      final mockSubtaskName = 'New Subtask';
      final mockTodoSubtaskId = 99;

      when(
        mockBaseApiService.post('', {
          'todoTaskId': mockJsonTodoTaskId,
          'name': mockSubtaskName,
        }),
      ).thenAnswer((_) async => mockTodoSubtaskId);

      // Act
      final result = await todoSubtaskService.addTodoSubtask(
        todoTaskId: mockJsonTodoTaskId,
        name: mockSubtaskName,
      );

      // Assert
      expect(result, isA<int>());
      expect(result, mockTodoSubtaskId);
    });

    test('should update Todo Subtask', () async {
      // Arrange
      final mockSubtaskName = 'Updated Subtask';
      final mockTodoSubtaskId = 99;

      when(
        mockBaseApiService.put('', {
          'id': mockTodoSubtaskId,
          'name': mockSubtaskName,
        }),
      ).thenAnswer((_) async => null);

      // Act
      await todoSubtaskService.updateTodoSubtask(
        id: mockTodoSubtaskId,
        name: mockSubtaskName,
      );

      // Assert
      verify(
        mockBaseApiService.put('', {
          'id': mockTodoSubtaskId,
          'name': mockSubtaskName,
        }),
      ).called(1);
    });

    test('should update Todo Subtask', () async {
      // Arrange
      final mockSubtaskName = 'Updated Subtask';
      final mockTodoSubtaskId = 99;

      when(
        mockBaseApiService.put('', {
          'id': mockTodoSubtaskId,
          'name': mockSubtaskName,
        }),
      ).thenAnswer((_) async => null);

      // Act
      await todoSubtaskService.updateTodoSubtask(
        id: mockTodoSubtaskId,
        name: mockSubtaskName,
      );

      // Assert
      verify(
        mockBaseApiService.put('', {
          'id': mockTodoSubtaskId,
          'name': mockSubtaskName,
        }),
      ).called(1);
    });

    test('should delete Todo Subtask', () async {
      // Arrange
      final mockTodoSubtaskId = 99;

      when(
        mockBaseApiService.delete('/$mockTodoSubtaskId'),
      ).thenAnswer((_) async => null);

      // Act
      await todoSubtaskService.deleteTodoSubtask(mockTodoSubtaskId);

      // Assert
      verify(mockBaseApiService.delete('/$mockTodoSubtaskId')).called(1);
    });

    test('should toggle Todo Subtask check status', () async {
      // Arrange
      final mockTodoSubtaskId = 99;
      final expectedNewCheckStatus = true;

      when(
        mockBaseApiService.patch('/$mockTodoSubtaskId', null),
      ).thenAnswer((_) async => expectedNewCheckStatus);

      // Act
      final result = await todoSubtaskService.toggleTodoSubtaskCheckStatus(
        mockTodoSubtaskId,
      );

      // Assert
      expect(result, isA<bool>());
      expect(result, expectedNewCheckStatus);
    });
  });
}

class _TestableTodoSubtaskService extends TodoSubtaskService {
  final BaseApiService mockBase;
  _TestableTodoSubtaskService(this.mockBase);

  @override
  Future<dynamic> get(String endpoint) => mockBase.get(endpoint);

  @override
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) =>
      mockBase.post(endpoint, data);

  @override
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) =>
      mockBase.put(endpoint, data);

  @override
  Future<dynamic> patch(String endpoint, Map<String, dynamic>? data) =>
      mockBase.patch(endpoint, data);

  @override
  Future<dynamic> delete(String endpoint) => mockBase.delete(endpoint);
}
