import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response, get;

import 'models/image.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter ++;
    Response response = await get("https://jsonplaceholder.typicode.com/photos/$counter");
    final Map<String, dynamic> data = jsonDecode(response.body);
    final ImageModel image = ImageModel.fromJson(data);

    setState(() {
      images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lets see some images"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
