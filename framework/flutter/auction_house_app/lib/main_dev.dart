import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/app_config.dart';

void main() {
  var configuredApp = AppConfig(
    navigatorKey: GlobalKey<NavigatorState>(),
    flavorName: "dev",
    apiBaseUrl: "http://10.0.2.2:8080",
    child: App(),
  );

  runApp(configuredApp);
}