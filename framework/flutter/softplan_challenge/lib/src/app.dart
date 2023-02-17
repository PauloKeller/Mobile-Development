import 'package:flutter/material.dart';
import 'package:softplan_challenge/src/pages/login/provider.dart';

import 'package:softplan_challenge/src/pages/pages.dart';
import 'package:softplan_challenge/src/pages/todos/provider.dart';
import 'package:softplan_challenge/src/repository/repository.dart';

import 'theme.dart';

class App extends StatefulWidget {
  final Repository repository;

  const App({Key key, @required this.repository}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      repository: widget.repository,
      child: TodosProvider(
        repository: widget.repository,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Softplan",
          theme: theme,
          home: LoginPage(),
        ),
      ),
    );
  }
}
