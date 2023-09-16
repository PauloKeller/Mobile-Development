import 'package:flutter/material.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';
import 'package:super_hero/src/widgets/widgets.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroModel hero;

  const HeroDetailsPage(this.hero, {Key? key}) : super(key: key);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.hero.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView(
          pageSnapping: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child:  HeroDetailsBoard(widget.hero),
            ),
            Container(
              child: PowerStatsIndicator(widget.hero.powerStats),
            ),
            Container(
              child: HeroBiographyDetails(widget.hero.biography),
            )
          ],
        ),
      ),
    );
  }
}
