// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:fix_now_aman_alkhdraa/core/config/di.dart';
import 'package:fix_now_aman_alkhdraa/datasources/user_remote_datasource.dart';

import '../core/models/user_session_model.dart';
import '../core/storage/app_prefrences.dart';
import '../core/storage/secure_session_storage.dart';
import '../repos/auth_repo.dart';
import '/core/constants/app_key.dart';
import 'network_exception.dart';
import 'service_remote_datasource.dart';

final AuthRemoteDatasourceProcider = Provider((ref) {
  final dio = ref.read(dioProvider);
  final secureSessionStorage = ref.read(secureSessionStorageProvider);
  final appPrefrences = ref.read(appPrefrencesProvider);
  final secureStorage = ref.read(secureStorageProvider);
  return AuthRemoteDatasource(
    dio: dio,
    secureSessionStorage: secureSessionStorage,
    appPrefrences: appPrefrences,
    secureStorage: secureStorage,
  );
});

class AuthRemoteDatasource {
  Dio dio;
  SecureSessionStorage secureSessionStorage;
  AppPrefrences appPrefrences;
  FlutterSecureStorage secureStorage;

  AuthRemoteDatasource({
    required this.dio,
    required this.secureSessionStorage,
    required this.appPrefrences,
    required this.secureStorage,
  });

  late Response response;
  final String endPointLogin = 'login';
  final String endPointLogout = 'logout';

  // AuthRemoteDatasource._();
  // static AuthRemoteDatasource? _instance;
  // static AuthRemoteDatasource getInstance() {
  //   if (_instance == null) {
  //     _instance = AuthRemoteDatasource._();
  //   }
  //   return _instance!;
  // }

  Future<bool> login({required Map<String, dynamic> loginInfo}) async {
    try {
      response = await dio.post(
        '${AppKeys.baseUrlKey}/$endPointLogin',
        data: loginInfo,
      );
      print('login response.statusCode:${response.statusCode}');
      if (response.statusCode == 200) {
        print(' token:${response.data['token']}');
        print(' --------------------------------------- ');
        secureSessionStorage.saveSession(
          userSession: UserSessionModel(
            accessToken: response.data['token'],
            // accessToken: AppKeys.accessTokenKey,
            // refreshToken: AppKeys.refreshTokenKey,
          ),
        );

        return true;
      }
      return false;
    } catch (e) {
      throw NetworkExceptions.getErrorMessage(e);
      print(e);
      return false;
    }
  }

  logout() async {
    try {
      UserSessionModel? userSession = await secureSessionStorage.getSession();
      print('---logout');
      print(userSession);
      if (userSession != null) {
        print(
          '${await secureStorage.read(key: AppKeys.accessTokenKey)} ##..##',
        );
        response = await dio.post(
          "${AppKeys.baseUrlKey}/$endPointLogout",
          options: Options(
            headers: {
              "Authorization":
                  // "Bearer $constToken",
                  "Bearer ${await secureStorage.read(key: AppKeys.accessTokenKey)}",

              // AppKeys.accessTokenKey: constToken,
              // AppKeys.accessTokenKey: userSession.accessToken,
              // AppKeys.refreshTokenKey: userSession!.refreshToken,
            },
          ),
        );
        print('000000');
        secureSessionStorage.clearSession();
      }
      print('88888888888');
    } catch (e) {
      throw NetworkExceptions.getErrorMessage(e);
    }
  }
}
