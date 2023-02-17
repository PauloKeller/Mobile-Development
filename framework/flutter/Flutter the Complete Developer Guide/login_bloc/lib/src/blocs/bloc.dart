import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:login_bloc/src/mixins/validators.dart';

class Bloc with ValidatorsMixin {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("$validEmail $validPassword");
  }

  dispose() {
    _passwordController.close();
    _emailController.close();
  }
}