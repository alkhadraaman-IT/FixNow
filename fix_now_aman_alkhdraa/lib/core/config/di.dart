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
  // getIt.registerSingleton<AuthRemoteDatasource>(AuthRemoteDatasource());
  // getIt.registerSingleton<ServiceRemoteDatasource>(ServiceRemoteDatasource());
}