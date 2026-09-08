import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/constants/app_key.dart';

class UserRemoteDatasource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;
  UserRemoteDatasource({required this.dio, required this.secureStorage});

  final String baseUrl = 'http://127.0.0.1:8000/api';
  final String endPoint = 'profile';
  late Response response;

  Future<Map<String, dynamic>?> getOne() async {
    response = await dio.get(
      '$baseUrl/$endPoint',
      options: Options(
        headers: {
          "Authorization":
              "Bearer fixnow_token_c906fff322194985b6332d7c1ac4a54b",
              // "Bearer ${secureStorage.read(key: AppKeys.accessTokenKey)}",
        },
      ),
    );
    return response.data;
  }
}
