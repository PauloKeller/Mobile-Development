import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softplan_challenge/src/repository/repository.dart';

import 'package:softplan_challenge/src/utils/utils.dart';

class LoginBloc with ValidationsMixin {
  final Repository repository;
  final _loginController = BehaviorSubject<String>();

  Observable<String> get login => _loginController.stream.transform(validateLogin);

  Function(String) get changeLogin => _loginController.sink.add;

  LoginBloc({@required this.repository});

  void saveLogin() {
    repository.saveIsLogged = true;
  }

  bool getIsLogged() {
    final value = repository.getIsLogged ?? false;
    return value;
  }

  void dispose() async {
    await _loginController.drain();
    _loginController.close();
  }
}
