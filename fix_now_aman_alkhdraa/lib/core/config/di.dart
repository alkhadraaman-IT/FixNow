import '../../datasources/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../datasources/service_remote_datasource.dart';

GetIt getIt=GetIt.instance;

Future<void> setup()async{
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  // getIt.registerSingleton<AuthRemoteDatasource>(AuthRemoteDatasource());
  // getIt.registerSingleton<ServiceRemoteDatasource>(ServiceRemoteDatasource());
}