import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/widgets/widgets.dart';

class HeroDetailsBoard extends StatelessWidget {
  final HeroModel _hero;

  const HeroDetailsBoard(this._hero, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 280.0,
            height: 280.0,
            child: HeroAvatar(_hero.images.lg, 300.0, () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: HeroAppearanceDetails(_hero.appearance),
          ),
        ],
      ),
    );
  }
}
