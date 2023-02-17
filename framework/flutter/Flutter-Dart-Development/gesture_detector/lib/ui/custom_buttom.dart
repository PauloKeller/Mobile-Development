import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(
          content: new Text("Hello Gestures!"),
          backgroundColor: Theme.of(context).backgroundColor,
          duration: new Duration(
              hours: 0,
              minutes: 0,
              seconds: 0,
              milliseconds: 700,
              microseconds: 0),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: new BorderRadius.circular(5.5)),
        child: new Text("First Buttom!"),
      ),
    );
  }
}
