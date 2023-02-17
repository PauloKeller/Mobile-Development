import 'package:dio/dio.dart';

import 'package:softplan_challenge/src/models/models.dart';

import 'services.dart';

class ServicesProvider implements Services {
  final Dio _dio;

  ServicesProvider(this._dio);

  @override
  Future<List<TodoModel>>fetchTodos() async {
    final response = await _dio.get("/todos");
    final List<dynamic> maps = response.data;
    final todos = maps.map((todo) => TodoModel.fromMap(todo)).toList();

    return todos;
  }

  @override
  Future<UserModel> fetchUser(int userId) async {
    final response = await _dio.get("/users/$userId");

    return UserModel.fromMap(response.data);
  }
}