import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,


        child:  new Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            const Text("Hello there"),
            const Text("Hey Again"),
            const Text("1")
          ],
        ),

//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text("Item 1",
//                textDirection: TextDirection.ltr,
//                style: new TextStyle(fontSize: 12.9)),
//            new Text("Item 2",
//                textDirection: TextDirection.ltr,
//                style: new TextStyle(fontSize: 12.9)),
//            const Expanded(child: const Text("Item 3")),
//          ],
//        )

//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              "First item",
//              textDirection: TextDirection.ltr,
//              style: new TextStyle(color: Colors.white),
//            ),
//            new Text(
//              "Second item",
//              textDirection: TextDirection.ltr,
//              style: new TextStyle(color: Colors.blue),
//            ),
//            new Container(
//              color: Colors.deepOrange,
//              alignment: Alignment.bottomLeft,
//              child: new Text(
//                "Third item",
//                textDirection: TextDirection.ltr,
//                style: new TextStyle(color: Colors.blue),
//              ),
//            )
//          ],
//        )

//      child: new Text(
//        "Hello Container",
//        textDirection: TextDirection.ltr,
//        style: new TextStyle(
//            color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18.3),
//      ),
        );
  }
}
