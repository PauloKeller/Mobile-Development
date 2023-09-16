import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/modules/hero_details/hero_details_module.dart';
import 'package:super_hero/src/widgets/heroes_home_list/heroes_home_list_item.dart';

class HeroesHomeList extends StatelessWidget {
  final UnmodifiableListView<HeroModel> _heroes;

  const HeroesHomeList(this._heroes, {Key? key}) : super(key: key);

  void _goToHeroDetails(BuildContext context, HeroModel model) {
    final route = MaterialPageRoute(builder: (context) => HeroDetailsPage(model));

    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _heroes.length,
      itemBuilder: (BuildContext context, int index) {
        final hero = _heroes[index];

        return HeroesHomeListItem(hero, () => _goToHeroDetails(context, hero));
      },
    );
  }
}
