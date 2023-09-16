import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/providers/hero/heroes_provider.dart';

abstract class HomeBlocInterface with ChangeNotifier {
  void fetchAllHeroes();
  HeroModel pickRandomHero();
  set errorMessage(String value);
  set hasError(bool value);
  bool get hasError;
  String get errorMessage;
  UnmodifiableListView<HeroModel> get heroes;
  UnmodifiableListView<HeroModel> filterBy(Gender gender);
}

class HomeBloc with ChangeNotifier implements HomeBlocInterface {
  HeroesProvider _heroesProvider;

  List<HeroModel> _heroes = [];
  bool _hasError = false;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _hasError = true;
    _errorMessage = value;

    notifyListeners();
  }

  bool get hasError => _hasError;

  set hasError(bool value) {
    _hasError = value;

    notifyListeners();
  }

  UnmodifiableListView<HeroModel> get heroes => UnmodifiableListView(_heroes);

  HomeBloc(this._heroesProvider) {
    fetchAllHeroes();
  }

  void fetchAllHeroes() async {
    try {
      final data = await _heroesProvider.getAllHeroes();
      _heroes = data.results;
    } catch (e) {
      _hasError = true;
      errorMessage = "Fail to fetch data";
    }

    notifyListeners();
  }

  UnmodifiableListView<HeroModel> filterBy(Gender gender) {
    final filtered = _heroes.where((element) => element.appearance.gender == gender);
    return UnmodifiableListView(filtered);
  }

  HeroModel pickRandomHero() {
    final random = new Random();
    return _heroes[random.nextInt(_heroes.length)];
  }
}