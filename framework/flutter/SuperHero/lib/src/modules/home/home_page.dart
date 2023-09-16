import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/modules/modules.dart';
import 'package:super_hero/src/widgets/widgets.dart';

enum HomeBottomNavigationBarOptions { all, female, male }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBlocInterface _homeBloc;

  HomeBottomNavigationBarOptions _selectedNavigationBarOption = HomeBottomNavigationBarOptions.all;

  Widget _selectHomeList() {
    return Consumer<HomeBlocInterface>(
      builder: (context, bloc, child) {
        if (bloc.hasError) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bloc.errorMessage),
                TextButton(
                  onPressed: _retry,
                  child: Text("retry"),
                )
              ],
            ),
          );
        }

        switch (_selectedNavigationBarOption) {
          case HomeBottomNavigationBarOptions.all:
            return HeroesHomeList(bloc.heroes);
          case HomeBottomNavigationBarOptions.female:
            return HeroesHomeList(bloc.filterBy(Gender.female));
          case HomeBottomNavigationBarOptions.male:
            return HeroesHomeList(bloc.filterBy(Gender.male));
        }
      },
    );
  }

  void _goToHeroDetails(HeroModel model) {
    final route = MaterialPageRoute(builder: (context) => HeroDetailsPage(model));

    Navigator.push(context, route);
  }

  void _actionButtonTapped() {
    final model = _homeBloc.pickRandomHero();
    _goToHeroDetails(model);
  }

  void _goToSearchDelegate() async {
    final result = await showSearch<HeroModel?>(context: context, delegate: _HomeSearchDelegate(_homeBloc.heroes));

    if (result != null) {
      _goToHeroDetails(result);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedNavigationBarOption = HomeBottomNavigationBarOptions.values[index];
    });
  }

  void _retry() {
    _homeBloc.hasError = false;
    _homeBloc.fetchAllHeroes();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _homeBloc = Provider.of<HomeBlocInterface>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super Hero"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _goToSearchDelegate,
          )
        ],
      ),
      body: Center(
        child: _selectHomeList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.subdirectory_arrow_right),
        onPressed: _actionButtonTapped,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.female),
            label: 'Female',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.male),
            label: 'Male',
          ),
        ],
        currentIndex: _selectedNavigationBarOption.index,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _HomeSearchDelegate extends SearchDelegate<HeroModel?> {
  final UnmodifiableListView<HeroModel> _heroes;

  _HomeSearchDelegate(this._heroes);

  UnmodifiableListView<HeroModel>? _filterByQuery({int matchCount = 0}) {
    if (query.length > matchCount) {
      final filtered = _heroes.where((hero) => hero.name.toLowerCase().contains(query.toLowerCase()));
      return UnmodifiableListView(filtered);
    }

    return _heroes;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filterByQuery(matchCount: 3);

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: results?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results?[index].name ?? "Empty"),
          leading: Icon(Icons.new_label),
          onTap: () {
            close(context, results?[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _filterByQuery();

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: results?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results?[index].name ?? "Empty"),
          onTap: () {
            close(context, results?[index]);
          },
        );
      },
    );
  }
}
