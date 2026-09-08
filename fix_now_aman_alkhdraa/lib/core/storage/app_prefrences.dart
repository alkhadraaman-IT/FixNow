import '/core/config/di.dart';

import '/core/constants/app_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefrences {
  AppPrefrences._();
  static AppPrefrences? _instance;
  static AppPrefrences getInstance() {
    if (_instance == null) {
      _instance = AppPrefrences._();
    }
    return _instance!;
  }

  final SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();

  Future<void> completOnbording() async {
    await sharedPreferences.setBool(AppKeys.isFirstTimeEnterKey, true);
  }

  Future<bool> isCompletOnbording() async {
    bool isCompleted =
        await sharedPreferences.getBool(AppKeys.isFirstTimeEnterKey) ?? false;

    return isCompleted;
  }
}
