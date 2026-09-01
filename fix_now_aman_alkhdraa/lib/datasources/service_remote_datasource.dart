import 'package:dio/dio.dart';
import '/core/datasources/base_datasource.dart';

import '../models/services_model.dart';


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
  ServiceRemoteDatasource({required this.dio});  

  @override
  Future<List<Map<String,dynamic>>?> getAll() async {
    try {
      response = await dio.get('$baseUrl/$endPoint');
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<Map<String,dynamic>?> getOne({required String itemId}) async {
    try {
      response = await dio.get('$baseUrl/$endPoint/$itemId');
      if (response.statusCode == 200) {
        return response.data;
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
