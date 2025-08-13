// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoSubtask _$TodoSubtaskFromJson(Map<String, dynamic> json) {
  return _TodoSubtask.fromJson(json);
}

/// @nodoc
mixin _$TodoSubtask {
  int get id => throw _privateConstructorUsedError;
  int get todoTaskId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  /// Serializes this TodoSubtask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoSubtask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoSubtaskCopyWith<TodoSubtask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoSubtaskCopyWith<$Res> {
  factory $TodoSubtaskCopyWith(
    TodoSubtask value,
    $Res Function(TodoSubtask) then,
  ) = _$TodoSubtaskCopyWithImpl<$Res, TodoSubtask>;
  @useResult
  $Res call({int id, int todoTaskId, String name, bool isChecked});
}

/// @nodoc
class _$TodoSubtaskCopyWithImpl<$Res, $Val extends TodoSubtask>
    implements $TodoSubtaskCopyWith<$Res> {
  _$TodoSubtaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoSubtask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoTaskId = null,
    Object? name = null,
    Object? isChecked = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            todoTaskId: null == todoTaskId
                ? _value.todoTaskId
                : todoTaskId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            isChecked: null == isChecked
                ? _value.isChecked
                : isChecked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoSubtaskImplCopyWith<$Res>
    implements $TodoSubtaskCopyWith<$Res> {
  factory _$$TodoSubtaskImplCopyWith(
    _$TodoSubtaskImpl value,
    $Res Function(_$TodoSubtaskImpl) then,
  ) = __$$TodoSubtaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int todoTaskId, String name, bool isChecked});
}

/// @nodoc
class __$$TodoSubtaskImplCopyWithImpl<$Res>
    extends _$TodoSubtaskCopyWithImpl<$Res, _$TodoSubtaskImpl>
    implements _$$TodoSubtaskImplCopyWith<$Res> {
  __$$TodoSubtaskImplCopyWithImpl(
    _$TodoSubtaskImpl _value,
    $Res Function(_$TodoSubtaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoSubtask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoTaskId = null,
    Object? name = null,
    Object? isChecked = null,
  }) {
    return _then(
      _$TodoSubtaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        todoTaskId: null == todoTaskId
            ? _value.todoTaskId
            : todoTaskId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isChecked: null == isChecked
            ? _value.isChecked
            : isChecked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoSubtaskImpl implements _TodoSubtask {
  const _$TodoSubtaskImpl({
    required this.id,
    required this.todoTaskId,
    required this.name,
    required this.isChecked,
  });

  factory _$TodoSubtaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoSubtaskImplFromJson(json);

  @override
  final int id;
  @override
  final int todoTaskId;
  @override
  final String name;
  @override
  final bool isChecked;

  @override
  String toString() {
    return 'TodoSubtask(id: $id, todoTaskId: $todoTaskId, name: $name, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoSubtaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.todoTaskId, todoTaskId) ||
                other.todoTaskId == todoTaskId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, todoTaskId, name, isChecked);

  /// Create a copy of TodoSubtask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoSubtaskImplCopyWith<_$TodoSubtaskImpl> get copyWith =>
      __$$TodoSubtaskImplCopyWithImpl<_$TodoSubtaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoSubtaskImplToJson(this);
  }
}

abstract class _TodoSubtask implements TodoSubtask {
  const factory _TodoSubtask({
    required final int id,
    required final int todoTaskId,
    required final String name,
    required final bool isChecked,
  }) = _$TodoSubtaskImpl;

  factory _TodoSubtask.fromJson(Map<String, dynamic> json) =
      _$TodoSubtaskImpl.fromJson;

  @override
  int get id;
  @override
  int get todoTaskId;
  @override
  String get name;
  @override
  bool get isChecked;

  /// Create a copy of TodoSubtask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoSubtaskImplCopyWith<_$TodoSubtaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
