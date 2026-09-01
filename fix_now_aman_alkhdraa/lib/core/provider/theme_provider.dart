import 'package:fix_now_aman_alkhdraa/core/constants/app_key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/di.dart';

// final sharedPreferencesProvider = AsyncNotifierProvider<SharedPreferences,bool>((ref) {
//   return getIt.get<SharedPreferences>();
// });

class ThemeProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void loadTheme() {
    state = getIt.get<SharedPreferences>().getBool(AppKeys.isDarkThemeKey) ?? false;
  }

  void toggleTheme() {
    state = getIt.get<SharedPreferences>().getBool(AppKeys.isDarkThemeKey) ?? false;
    state = !state;
    getIt.get<SharedPreferences>().setBool(AppKeys.isDarkThemeKey, state);
  }
}
