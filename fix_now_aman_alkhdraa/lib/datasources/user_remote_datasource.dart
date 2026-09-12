import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/constants/app_key.dart';
import 'network_exception.dart';

String constToken = 'fixnow_token_000e55907bf84b7581004d35d0f58a79';

class UserRemoteDatasource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;
  UserRemoteDatasource({required this.dio, required this.secureStorage});

  final String endPoint = 'profile';
  late Response response;

  Future<Map<String, dynamic>?> getOne() async {
    try {
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
      return response.data;
    } catch (e) {
      throw NetworkExceptions.getErrorMessage(e);
    }
  }
}
