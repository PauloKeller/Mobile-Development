import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_hero/src/modules/modules.dart';
import 'package:super_hero/src/providers/hero/heroes_provider.dart';

import 'modules/home/home_module.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final _heroesProvider = HeroesProvider(Dio(BaseOptions(baseUrl: "https://akabab.github.io/superhero-api/api")));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBlocInterface>(create: (context) => HomeBloc(_heroesProvider)),
      ],
      child: MaterialApp(
        title: "Super Hero",
        home: HomePage(),
      ),
    );
  }
}
