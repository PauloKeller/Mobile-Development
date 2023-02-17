import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:softplan_challenge/src/repository/providers/providers.dart';

void main() {
  final _baseUrl = "https://jsonplaceholder.typicode.com";
  Dio _dio;
  ServicesProvider _servicesProvider;

  setUp(() {
    final options = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(options);
    _servicesProvider = ServicesProvider(_dio);
  });

  group("Test API Provider", () {
    test("fetch user by id", () async {
      final user = await _servicesProvider.fetchUser(1);

      expect(user.name, "Leanne Graham");
      expect(user.email, "Sincere@april.biz");
    });

    test("fetch all todos", () async{
      final todos = await _servicesProvider.fetchTodos();

      expect(todos.length > 0, true);
      expect(todos[0].id, 1);
    });
  });
}
