import 'package:flutter/material.dart';

import 'package:auction_house_app/src/pages/pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => AuctionsPage()
    );

    Future.delayed(Duration(seconds: 2), () => Navigator.push(context, route));

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(
              "Splash Screen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
