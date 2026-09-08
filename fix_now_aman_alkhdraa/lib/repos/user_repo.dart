// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/datasources/user_remote_datasource.dart';
import '/models/user_model.dart';

class UserRepo {
  final InternetConnectionChecker internetConnectionChecker;
  UserRepo({required this.internetConnectionChecker});
  Future<UserModel?> getOne() async {
    if (await internetConnectionChecker.hasConnection) {
      Map<String, dynamic>? user = await UserRemoteDatasource(
        dio: Dio(),
        secureStorage: FlutterSecureStorage(),
      ).getOne();
      if (user != null) {
        return UserModel.fromMap(user);
      }
      return null;
    }
    throw Exception('No internet connection');
  }
}
