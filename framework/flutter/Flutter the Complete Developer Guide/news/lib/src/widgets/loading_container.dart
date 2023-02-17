import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  Widget buildContainer() {
    return Container(
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      color: Colors.grey[200],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Divider(
            height: 8.0,
            indent: 10.0,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
