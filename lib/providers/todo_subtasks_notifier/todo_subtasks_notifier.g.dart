// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_subtasks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoSubTasksNotifierHash() =>
    r'2579b857c84861b4f57a16724e7d6b53306f2a5f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TodoSubTasksNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<TodoSubtask>> {
  late final int todoTaskId;

  FutureOr<List<TodoSubtask>> build(int todoTaskId);
}

/// See also [TodoSubTasksNotifier].
@ProviderFor(TodoSubTasksNotifier)
const todoSubTasksNotifierProvider = TodoSubTasksNotifierFamily();

/// See also [TodoSubTasksNotifier].
class TodoSubTasksNotifierFamily extends Family<AsyncValue<List<TodoSubtask>>> {
  /// See also [TodoSubTasksNotifier].
  const TodoSubTasksNotifierFamily();

  /// See also [TodoSubTasksNotifier].
  TodoSubTasksNotifierProvider call(int todoTaskId) {
    return TodoSubTasksNotifierProvider(todoTaskId);
  }

  @override
  TodoSubTasksNotifierProvider getProviderOverride(
    covariant TodoSubTasksNotifierProvider provider,
  ) {
    return call(provider.todoTaskId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoSubTasksNotifierProvider';
}

/// See also [TodoSubTasksNotifier].
class TodoSubTasksNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          TodoSubTasksNotifier,
          List<TodoSubtask>
        > {
  /// See also [TodoSubTasksNotifier].
  TodoSubTasksNotifierProvider(int todoTaskId)
    : this._internal(
        () => TodoSubTasksNotifier()..todoTaskId = todoTaskId,
        from: todoSubTasksNotifierProvider,
        name: r'todoSubTasksNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$todoSubTasksNotifierHash,
        dependencies: TodoSubTasksNotifierFamily._dependencies,
        allTransitiveDependencies:
            TodoSubTasksNotifierFamily._allTransitiveDependencies,
        todoTaskId: todoTaskId,
      );

  TodoSubTasksNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todoTaskId,
  }) : super.internal();

  final int todoTaskId;

  @override
  FutureOr<List<TodoSubtask>> runNotifierBuild(
    covariant TodoSubTasksNotifier notifier,
  ) {
    return notifier.build(todoTaskId);
  }

  @override
  Override overrideWith(TodoSubTasksNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoSubTasksNotifierProvider._internal(
        () => create()..todoTaskId = todoTaskId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todoTaskId: todoTaskId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    TodoSubTasksNotifier,
    List<TodoSubtask>
  >
  createElement() {
    return _TodoSubTasksNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoSubTasksNotifierProvider &&
        other.todoTaskId == todoTaskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todoTaskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TodoSubTasksNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<TodoSubtask>> {
  /// The parameter `todoTaskId` of this provider.
  int get todoTaskId;
}

class _TodoSubTasksNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          TodoSubTasksNotifier,
          List<TodoSubtask>
        >
    with TodoSubTasksNotifierRef {
  _TodoSubTasksNotifierProviderElement(super.provider);

  @override
  int get todoTaskId => (origin as TodoSubTasksNotifierProvider).todoTaskId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
