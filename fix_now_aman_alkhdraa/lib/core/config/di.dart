import 'package:fix_now_aman_alkhdraa/core/constants/app_key.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../models/service_model.dart';
import '/core/storage/app_prefrences.dart' show AppPrefrences;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/core/storage/secure_session_storage.dart';

import '../../datasources/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../datasources/service_remote_datasource.dart';

GetIt getIt=GetIt.instance;

Future<void> setup()async{
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.registerSingleton<AppPrefrences>(AppPrefrences.getInstance());
  getIt.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker.instance);
  getIt.registerSingleton<Box<ServiceModel>>(Hive.box(AppKeys.cartBoxKey));
  // getIt.registerSingleton<AuthRemoteDatasource>(AuthRemoteDatasource());
  // getIt.registerSingleton<ServiceRemoteDatasource>(ServiceRemoteDatasource());
}