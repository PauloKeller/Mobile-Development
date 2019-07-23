import 'dart:convert';

import 'package:http/http.dart' show Client;

import 'package:news/src/models/item.dart';

import 'repository.dart';

class NewsApiProvider implements Source {
  Client client = Client();
  final _root = "https://hacker-news.firebaseio.com/v0";

  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$_root/topstories.json");
    final ids = jsonDecode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$_root/item/$id.json");
    final json = jsonDecode(response.body);
    return ItemModel.fromJson(json);
  }
}
