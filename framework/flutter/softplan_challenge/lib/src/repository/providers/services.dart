import 'package:softplan_challenge/src/models/models.dart';

abstract class Services {
  Future<UserModel> fetchUser(int userId);
  Future<List<TodoModel>> fetchTodos();
}