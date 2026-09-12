// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/constants/app_key.dart';
import 'network_exception.dart';
import 'user_remote_datasource.dart';

final dioProvider = Provider(((ref) => Dio()));

final secureStorageProvider = Provider((ref) {
  return FlutterSecureStorage();
});

final serviceRemoteDatasourceProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  final secureStorage = ref.read(secureStorageProvider);
  return ServiceRemoteDatasource(dio: dio, secureStorage: secureStorage);
});

class ServiceRemoteDatasource {
  // ServiceRemoteDatasource._();
  // static ServiceRemoteDatasource? _instance;
  // static ServiceRemoteDatasource getInstance() {
  //   if (_instance == null) {
  //     _instance = ServiceRemoteDatasource._();
  //   }
  //   return _instance!;
  // }

  final Dio dio;
  late Response response;
  final String endPoint = 'services';

  FlutterSecureStorage secureStorage;
  ServiceRemoteDatasource({required this.dio, required this.secureStorage});

  Future<List<dynamic>?> getAll() async {
    try {
      print("=.=.=.=.=.=.=${await secureStorage.read(key: AppKeys.accessTokenKey)}");
      response = await dio.get(
        '${AppKeys.baseUrlKey}/$endPoint',
        options: Options(
          headers: {
            "Authorization":
                    // "Bearer $constToken",
                "Bearer ${await secureStorage.read(key: AppKeys.accessTokenKey)}",
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data.runtimeType);
        print(' ================================================ ');
        print(response.data);

        return response.data;
      }
      print('111111');
      return null;
    } catch (e) {
      print('222222');
      print(e);
      throw NetworkExceptions.getErrorMessage(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getOne({required String itemId}) async {
    try {
      response = await dio.get(
        '${AppKeys.baseUrlKey}/$endPoint/$itemId',
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${secureStorage.read(key: AppKeys.accessTokenKey)}",
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      print(e);
      throw NetworkExceptions.getErrorMessage(e);
      return null;
    }
  }
}
