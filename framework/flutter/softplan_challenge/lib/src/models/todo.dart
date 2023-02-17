class TodoModel {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  TodoModel.fromMap(Map<String, dynamic>map)
      : id = map['id'],
        userId = map['userId'],
        title = map['title'],
        completed = map['completed'];
}