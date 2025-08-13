// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task_async_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoTaskNotifierHash() => r'278d540101a79690a23e608bbe0d9045dcbd2cce';

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

abstract class _$TodoTaskNotifier
    extends BuildlessAutoDisposeAsyncNotifier<TodoTask> {
  late final int id;

  FutureOr<TodoTask> build(int id);
}

/// See also [TodoTaskNotifier].
@ProviderFor(TodoTaskNotifier)
const todoTaskNotifierProvider = TodoTaskNotifierFamily();

/// See also [TodoTaskNotifier].
class TodoTaskNotifierFamily extends Family<AsyncValue<TodoTask>> {
  /// See also [TodoTaskNotifier].
  const TodoTaskNotifierFamily();

  /// See also [TodoTaskNotifier].
  TodoTaskNotifierProvider call(int id) {
    return TodoTaskNotifierProvider(id);
  }

  @override
  TodoTaskNotifierProvider getProviderOverride(
    covariant TodoTaskNotifierProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoTaskNotifierProvider';
}

/// See also [TodoTaskNotifier].
class TodoTaskNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TodoTaskNotifier, TodoTask> {
  /// See also [TodoTaskNotifier].
  TodoTaskNotifierProvider(int id)
    : this._internal(
        () => TodoTaskNotifier()..id = id,
        from: todoTaskNotifierProvider,
        name: r'todoTaskNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$todoTaskNotifierHash,
        dependencies: TodoTaskNotifierFamily._dependencies,
        allTransitiveDependencies:
            TodoTaskNotifierFamily._allTransitiveDependencies,
        id: id,
      );

  TodoTaskNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<TodoTask> runNotifierBuild(covariant TodoTaskNotifier notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(TodoTaskNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoTaskNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TodoTaskNotifier, TodoTask>
  createElement() {
    return _TodoTaskNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoTaskNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TodoTaskNotifierRef on AutoDisposeAsyncNotifierProviderRef<TodoTask> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TodoTaskNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TodoTaskNotifier, TodoTask>
    with TodoTaskNotifierRef {
  _TodoTaskNotifierProviderElement(super.provider);

  @override
  int get id => (origin as TodoTaskNotifierProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
