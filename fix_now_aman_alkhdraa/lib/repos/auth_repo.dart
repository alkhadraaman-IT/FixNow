// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/provider/conecction_provider.dart';
import '../datasources/service_remote_datasource.dart';
import '/core/config/di.dart';
import '/core/models/user_session_model.dart';
import '/core/storage/app_prefrences.dart';
import '/core/storage/secure_session_storage.dart';
import '/datasources/auth_remote_datasource.dart';
import '/models/login_model.dart';

final secureSessionStorageProvider = Provider((ref) {
  return SecureSessionStorage(secureSession: FlutterSecureStorage());
});

final appPrefrencesProvider = Provider((ref) {
  return getIt.get<AppPrefrences>();
});

final authRemoteDatasource = Provider((ref) {
  final dio = ref.read(dioProvider);
  final secureSessionStorage = ref.read(secureSessionStorageProvider);
  final appPrefrences = ref.read(appPrefrencesProvider);
  return AuthRemoteDatasource(
    dio: dio,
    secureSessionStorage: secureSessionStorage,
    appPrefrences: appPrefrences,
  );
});

final authRepoProvider = Provider((ref) {
  final appPrefrences = getIt.get<AppPrefrences>();
  final secureSessionStorage = ref.read(secureSessionStorageProvider);
  final internetConnectionChecker = getIt.get<InternetConnectionChecker>();
  return AuthRepo(
    appPrefrences: appPrefrences,
    secureSessionStorage: secureSessionStorage,
    internetConnectionChecker: internetConnectionChecker,
  );
});

class AuthRepo {
  final InternetConnectionChecker internetConnectionChecker;
  final AppPrefrences appPrefrences;
  final SecureSessionStorage secureSessionStorage;
  AuthRepo({
    required this.internetConnectionChecker,
    required this.appPrefrences,
    required this.secureSessionStorage,
  });

  Future<bool> login({required LoginModel loginInfo}) async {
    if (await internetConnectionChecker.hasConnection) {
      return await getIt.get<AuthRemoteDatasource>().login(
        loginInfo: loginInfo.toMap(),
      );
    }
    throw Exception('No internet connection');
  }

  Future logout() async {
    if (await internetConnectionChecker.hasConnection) {
      return getIt.get<AuthRemoteDatasource>().logout();
    }
    throw Exception('No internet connection');
  }

  Future<bool> isCompleteOnboarding() async {
    if (await internetConnectionChecker.hasConnection) {
      return appPrefrences.isCompletOnbording();
    }
    throw Exception('No internet connection');
  }

  Future<void> completeOnboarding() async {
    if (await internetConnectionChecker.hasConnection) {
      return appPrefrences.completOnbording();
    }
    throw Exception('No internet connection');
  }

  Future<bool> restoreSession() async {
    if (await internetConnectionChecker.hasConnection) {
      UserSessionModel? userSession = await secureSessionStorage.getSession();
      return userSession != null ? true : false;
    }
    throw Exception('No internet connection');
  }
}
