// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import '/core/constants/app_key.dart';

import '../core/models/user_session_model.dart';
import '../core/storage/app_prefrences.dart';
import '../core/storage/secure_session_storage.dart';

  
class AuthRemoteDatasource {
  Dio dio;
  SecureSessionStorage secureSessionStorage;
  AppPrefrences appPrefrences;

  AuthRemoteDatasource({
    required this.dio,
    required this.secureSessionStorage,
    required this.appPrefrences,
  });

  late Response response;
  final String baseUrl = 'http://127.0.0.1:8000/api';
  final String endPoint = 'login';

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
      response = await dio.post('$baseUrl/$endPoint', data: loginInfo);
      if (response.statusCode == 200) {
        secureSessionStorage.saveSession(
          userSession: UserSessionModel(
            accessToken: AppKeys.accessTokenKey,
            // refreshToken: AppKeys.refreshTokenKey,
          ),
        );
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  logout() async {
    UserSessionModel? userSession = await secureSessionStorage.getSession();
    if (userSession != null) {}
    response = await dio.post(
      "$baseUrl/$endPoint",
      options: Options(
        headers: {
          AppKeys.accessTokenKey: userSession!.accessToken,
          // AppKeys.refreshTokenKey: userSession!.refreshToken,
        },
      ),
    );
    secureSessionStorage.clearSession();
  }

  
}