import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/widgets/hero_avatar/hero_avatar.dart';

class HeroesHomeListItem extends StatelessWidget {
  final HeroModel _hero;
  final VoidCallback _onTap;

  const HeroesHomeListItem(this._hero, this._onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _hero.name,
        key: Key(_hero.name),
      ),
      subtitle: Text(_hero.appearance.gender.name),
      leading: Container (
        width: 60.0,
        height: 60.0,
        child: HeroAvatar(_hero.images.lg, 50.0, _onTap),
      ),
      onTap: _onTap,
    );
  }
}
