import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.apiBaseUrl,
    @required this.flavorName,
    @required this.navigatorKey,
    Widget child,
  }) : super(child: child);

  final String apiBaseUrl;
  final String flavorName;
  final GlobalKey<NavigatorState> navigatorKey;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
