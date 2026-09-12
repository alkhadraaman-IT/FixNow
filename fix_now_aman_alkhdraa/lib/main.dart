import 'package:hive_ce_flutter/adapters.dart';

import '/core/constants/app_key.dart';

import '/core/provider/theme_provider.dart';

import '/views/onbording_view.dart';
import '/widgets/onbording_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

import '/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'core/models/onbording_model.dart';
import 'core/provider/user_session_provider.dart';
import 'core/theme/app_theme.dart';
import '/widgets/main_navigation_bar_widget.dart';
import 'core/config/di.dart';
import 'models/cart_item_model.dart';
import 'models/provider_model.dart';
import 'models/service_model.dart';
import 'views/login_view.dart';
import 'views/service_booked_view.dart';
import 'views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ProviderModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());
  Hive.registerAdapter(CartItemModelAdapter());

  Box<ServiceModel> cartBox = await Hive.openBox<ServiceModel>(
    AppKeys.cartBoxKey,
  );
  Box<CartItemModel> cartWithQuatityBox = await Hive.openBox<CartItemModel>(
    AppKeys.cartBoxWithQuatityKey,
  );
  Box<ServiceModel> favoriteBox = await Hive.openBox<ServiceModel>(
    AppKeys.favoriteBoxKey,
  );
  await setup();

  runApp(ProviderScope(child: FixNow()));
}

class FixNow extends ConsumerWidget {
  const FixNow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var themeListener = ref.watch(themeProvider);
    // var userSessionListener = ref.watch(userSessionProvider);
    
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 884),
      builder: (_, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.ligthTheme,
          // darkTheme: AppTheme.darkTheme,
          // themeMode: themeListener==true ? ThemeMode.dark : ThemeMode.light,
          home: SplashView(),
        );
      },
    );
  }
}
