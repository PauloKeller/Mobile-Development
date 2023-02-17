import 'package:flutter/material.dart';
import 'package:softplan_challenge/src/repository/repository.dart';

import 'bloc.dart';

class LoginProvider extends InheritedWidget {
  final LoginBloc bloc;

  LoginProvider({
    Key key,
    Widget child,
    @required Repository repository,
  })  : bloc = LoginBloc(repository: repository),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginProvider) as LoginProvider).bloc;
  }
}
