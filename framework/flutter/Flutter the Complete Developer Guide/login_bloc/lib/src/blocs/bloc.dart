import 'dart:async';

import 'package:login_bloc/src/mixins/validators.dart';

class Bloc with ValidatorsMixin {
  final StreamController<String> _emailController = StreamController<String>();
  final StreamController<String> _passwordController = StreamController<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _passwordController.close();
    _emailController.close();
  }
}