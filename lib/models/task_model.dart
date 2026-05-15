class TaskModel {
  String id;
  String title;
  String description;
  String createdAt;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map, String id) {
    return TaskModel(
      id: id,
      title: map['title'],
      description: map['description'],
      createdAt: map['createdAt'],
      isCompleted: map['isCompleted'],
    );
  }
}