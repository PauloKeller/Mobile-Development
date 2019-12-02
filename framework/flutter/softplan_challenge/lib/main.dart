import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:softplan_challenge/src/repository/repository.dart';
import 'package:softplan_challenge/src/utils/utils.dart';

import 'src/app.dart';

void main() async {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  final options = BaseOptions(baseUrl: baseUrl);
  final dio = Dio(options);
  final sharedPref = await SharedPrefUtils.getInstance();
  final storageProvider = StorageProvider(sharedPref);
  final servicesProvider = ServicesProvider(dio);

  final repository = Repository(servicesProvider, storageProvider);

  runApp(App(repository: repository,));
}