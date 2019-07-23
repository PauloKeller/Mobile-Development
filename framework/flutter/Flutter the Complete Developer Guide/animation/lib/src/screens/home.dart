import 'dart:math';

import 'package:flutter/material.dart';

import 'package:animation/src/widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  Animation<double> boxAnimation;
  AnimationController boxController;
  AnimationController catController;

  Widget buildBox() {
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      top: -1.0,
      left: 1.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: boxAnimation.value,
            alignment: Alignment.topLeft,
            child: child,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      top: -1.0,
      right: 1.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: -boxAnimation.value,
            alignment: Alignment.topRight,
            child: child,
          );
        },
      ),
    );
  }

  void onTap() {
    if (catController.status == AnimationStatus.completed) {
      boxController.forward();
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      boxController.stop();
      catController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    boxController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    boxController.forward();

    catAnimation = Tween(
      begin: -35.0,
      end: -80.0,
    ).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    boxAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 0.65,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOut,
      ),
    );

    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation!"),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
      ),
    );
  }
}
