class TaskModel {
  String id;
  String title;
  String description;
  String date;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map, String id) {
    return TaskModel(
      id: id,
      title: map['title'],
      description: map['description'],
      date: DateTime.now().millisecondsSinceEpoch.toString(),
      isCompleted: map['isCompleted'],
    );
  }
}