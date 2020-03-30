import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/app_config.dart';

void mainCommon() {
// Here would be background init code, if any
}

void main() {
  var configuredApp = AppConfig(
    navigatorKey: GlobalKey<NavigatorState>(),
    flavorName: "release",
    apiBaseUrl: "http://localhost:8080",
    child: App(),
  );

  mainCommon();

  runApp(configuredApp);
}