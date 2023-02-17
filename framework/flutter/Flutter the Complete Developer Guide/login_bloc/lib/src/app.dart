import 'package:flutter/material.dart';

import 'package:login_bloc/src/screen/login_screen.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Log Me In",
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
