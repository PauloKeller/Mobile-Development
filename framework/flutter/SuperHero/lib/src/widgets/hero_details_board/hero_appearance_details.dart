import 'package:flutter/material.dart';
import 'package:super_hero/src/models/appearance/appearance_model.dart';

class HeroAppearanceDetails extends StatelessWidget {
  final AppearanceModel _appearance;

  const HeroAppearanceDetails(this._appearance, {Key? key}) : super(key: key);

  Widget _buildText(String value) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        value,
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(_appearance.race),
          _buildText(_appearance.eyeColor),
          _buildText(_appearance.hairColor),
          _buildText(_appearance.gender.name),
        ],
      ),
    );
  }
}
