// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/constants/app_key.dart';

final dioProvider = Provider(((ref) => Dio()));

final secureStorageProvider = Provider((ref) {
  return FlutterSecureStorage();
});

final serviceRemoteDatasource = Provider((ref) {
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
  final String baseUrl = 'http://127.0.0.1:8000/api';
  final String endPoint = 'services';

  FlutterSecureStorage secureStorage;
  ServiceRemoteDatasource({required this.dio, required this.secureStorage});

  Future<List<Map<String, dynamic>>?> getAll() async {
    try {
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
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getOne({required String itemId}) async {
    try {
      response = await dio.get(
        '$baseUrl/$endPoint/$itemId',
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
      return null;
    }
  }
}

// class ServiceRemoteDatasource extends BaseDataSource<ServiceModel> {
//   final Dio dio;
//   ServiceRemoteDatasource({required this.dio});
//   final String endpoint;
//   ServiceRemoteDatasource._();
//   static ServiceRemoteDatasource? _instance;
//   static ServiceRemoteDatasource getInstance() {
//     if (_instance == null) {
//       _instance = ServiceRemoteDatasource._();
//     }
//     return _instance!;
//   }

//   @override
//   Future<bool> createItem({required ServiceModel newItem}) {
//   }

//   @override
//   Future<bool> deleteItem({required String deleteItemId}) {
//   }

//   @override
//   Future<List<dynamic>?> getAll() async {
//     try {
//       response = await dio.get('$baseUrl/$endpoint');
//       if (response.statusCode == 200) {
//         return response.data;
//       }
//       return null;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<ServiceModel?> getOne({required String itemId}) async {
//     try {
//       response = await dio.get('$baseUrl/$endpoint/$itemId');
//       if (response.statusCode == 200) {
//         return response.data;
//       }
//       return null;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> updateItem({required ServiceModel updeteItem}) {
//   }
// }
