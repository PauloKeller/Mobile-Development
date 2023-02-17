export 'providers/providers.dart';

import 'package:dio/dio.dart';

import 'package:softplan_challenge/src/models/models.dart';
import 'providers/providers.dart';


class Repository {
  final ServicesProvider servicesProvider;
  final StorageProvider storageProvider;

  Repository(this.servicesProvider, this.storageProvider);

  Future<UserModel> fetchUserById(int id) => servicesProvider.fetchUser(id);

  Future<List<TodoModel>> fetchAllTodos() => servicesProvider.fetchTodos();

  set saveIsLogged(bool isLogged) => storageProvider.isLogged = isLogged;

  bool get getIsLogged => storageProvider.isLogged;

  Future<bool> get clear => storageProvider.clear;
}