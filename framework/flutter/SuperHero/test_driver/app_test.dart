import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('Test driver', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test("should see the home screen", () async {
      SerializableFinder firstItem = findByKey('A-Bomb');

      expect(await driver.getText(firstItem), "A-Bomb");
    });
  });
}
