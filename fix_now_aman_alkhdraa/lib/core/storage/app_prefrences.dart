import 'package:fix_now_aman_alkhdraa/core/constants/app_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefrences {
  final SharedPreferences sharedPreferences;

  AppPrefrences({required this.sharedPreferences});

  Future<void> completOnbording() async {
    await sharedPreferences.setBool(AppKeys.isFirstTimeEnterKey, true);
  }

  Future<bool> isCompletOnbording() async {
    bool isCompleted =
        await sharedPreferences.getBool(AppKeys.isFirstTimeEnterKey) ?? false;

    return isCompleted;
  }
}
