import 'package:flutter_driver/flutter_driver.dart';

Future<void> scrollIntoView(FlutterDriver driver, SerializableFinder element) async {
  return await driver.scrollIntoView(element);
}

SerializableFinder findByKey(String key) {
  return find.byValueKey(key);
}