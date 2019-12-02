import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  SP_IS_LOGGED_KEY,
}

class SharedPrefUtils {
  static SharedPrefUtils _instance;

  static Future<SharedPrefUtils> get instance async {
    return await getInstance();
  }

  static SharedPreferences _spf;

  SharedPrefUtils._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SharedPrefUtils> getInstance() async {
    if (_instance == null) {
      _instance = new SharedPrefUtils._();
      await _instance._init();
    }
    return _instance;
  }

  bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key);
  }

  Set<String> getKeys() {
    if (_beforeCheck()) return null;
    return _spf.getKeys();
  }

  bool getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf.getBool(key);
  }

  Future<bool> putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _spf.setBool(key, value);
  }

  Future<bool> remove(String key) {
    if (_beforeCheck()) return null;
    return _spf.remove(key);
  }

  Future<bool> clear() {
    if (_beforeCheck()) return null;
    return _spf.clear();
  }
}
