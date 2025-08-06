class TodoSubtaskModel {
  final int id;
  final int todoTaskId;
  final String name;
  final bool isChecked;

  TodoSubtaskModel({
    required this.id,
    required this.todoTaskId,
    required this.name,
    required this.isChecked,
  });

  factory TodoSubtaskModel.fromJson(Map<String, dynamic> json) {
    return TodoSubtaskModel(
      id: json['id'],
      todoTaskId: json['todoTaskId'],
      name: json['name'],
      isChecked: json['isChecked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todoTaskId': todoTaskId,
      'name': name,
      'isChecked': isChecked,
    };
  }
}
