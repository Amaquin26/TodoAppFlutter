class TodoTaskModel {
  final int id;
  final String title;
  final String? description;

  TodoTaskModel({required this.id, required this.title, this.description});

  factory TodoTaskModel.fromJson(Map<String, dynamic> json) {
    return TodoTaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'description': description};
  }
}
