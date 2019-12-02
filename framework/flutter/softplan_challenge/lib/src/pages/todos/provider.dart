import 'package:flutter/material.dart';
import 'package:softplan_challenge/src/repository/repository.dart';

import 'bloc.dart';

class TodosProvider extends InheritedWidget {
  final TodosBloc bloc;

  TodosProvider({
    Key key,
    Widget child,
    @required Repository repository,
  })  : bloc = TodosBloc(repository: repository),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TodosBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TodosProvider) as TodosProvider).bloc;
  }
}
