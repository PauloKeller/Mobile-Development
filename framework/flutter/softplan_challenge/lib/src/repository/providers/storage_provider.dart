import 'package:softplan_challenge/src/utils/utils.dart';

import 'storage.dart';

class StorageProvider implements Storage {
  final SharedPrefUtils sharedPrefUtils;

  StorageProvider(this.sharedPrefUtils);

  @override
  bool get isLogged {
    return sharedPrefUtils.getBool(SharedPreferencesKeys.SP_IS_LOGGED_KEY.toString());
  }

  @override
  set isLogged(bool value) {
    sharedPrefUtils.putBool(SharedPreferencesKeys.SP_IS_LOGGED_KEY.toString(), value);
  }

  @override
  Future<bool> get clear => sharedPrefUtils.clear();
}
