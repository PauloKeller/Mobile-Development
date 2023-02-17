import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:softplan_challenge/src/models/models.dart';
import 'package:softplan_challenge/src/repository/repository.dart';

class TodosBloc {
  final Repository repository;
  final _todos = PublishSubject<List<TodoModel>>();

  Observable<List<TodoModel>> get todos => _todos.stream;

  TodosBloc({@required this.repository});

  logout() async {
    final value = await repository.clear;
  }

  Future<void> fetchAllTodos() async {
    final todos = await repository.fetchAllTodos();
    _todos.sink.add(todos);
  }

  Future<UserModel> fetchUserById(int userId) async {
    final user = await repository.fetchUserById(userId);
    return user;
  }

 Future<void> dispose() async {
    await _todos.drain();
    _todos.close();
  }
}