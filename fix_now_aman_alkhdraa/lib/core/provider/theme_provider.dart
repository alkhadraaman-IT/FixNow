// import '/core/constants/app_key.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../config/di.dart';

// // final sharedPreferencesProvider = AsyncNotifierProvider<SharedPreferences,bool>((ref) {
// //   return getIt.get<SharedPreferences>();
// // });

// // final themeProvider = AsyncNotifierProvider<ThemeProvider,bool>(() {
// //   return ThemeProvider();
// // });
// final themeProvider = Provider<ThemeProvider>((ref) {
//   return ThemeProvider();
// });
// class ThemeProvider extends AsyncNotifier<bool> {

//   @override
//   bool build() {    print('<<<<<<<<<<<<<< build themeProvider >>>>>>>>>>>>>>>>');

//     return false;
//   }

//   Future<bool> loadTheme() async {print('<<<<<<<<<<<<<< loadTheme >>>>>>>>>>>>>>>>');
//     bool theme= getIt.get<SharedPreferences>().getBool(AppKeys.isDarkThemeKey) ?? false;
//     state =AsyncData(theme);
//     return state.value!;
//   }

//   void toggleTheme() {
// print('<<<<<<<<<<<<<< toggleTheme >>>>>>>>>>>>>>>>');

//     bool theme =
//         getIt.get<SharedPreferences>().getBool(AppKeys.isDarkThemeKey) ?? false;
//     state = !theme;
//     getIt.get<SharedPreferences>().setBool(AppKeys.isDarkThemeKey, state.value!);
//   }
// }
