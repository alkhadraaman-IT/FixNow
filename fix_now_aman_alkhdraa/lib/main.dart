import '/views/onbording_view.dart';
import '/widgets/onbording_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'core/models/onbording_model.dart';
import 'core/theme/app_theme.dart';
import '/widgets/main_navigation_bar_widget.dart';
import 'core/config/di.dart';
import 'views/service_booked_view.dart';
import 'views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(FixNow());
}

class FixNow extends StatelessWidget {
  const FixNow({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 884),
      builder: (_, _) {
        return ProviderScope(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.ligthTheme,
            darkTheme: AppTheme.darkTheme,
            // themeMode: themProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: SplashView(),
          ),
        );
      },
    );
  }
}
