import 'dart:async';

import 'regex_utils.dart';

mixin ValidationsMixin {
  final validateLogin = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (!RegexUtils.isLowerCase(value)) {
      sink.addError("Aceito apenas caracters em minúsculo!");
    } else {
      sink.add(value);
    }
  });
}
