import 'package:dio/dio.dart';

abstract class BaseDataSource<T> {
  late Response response;
  final String baseUrl = '';
  Future<List<T>?> getAll();
  Future<T?> getOne({required String itemId});
  Future<bool> createItem({required T newItem});
  Future<bool> updateItem({required T updeteItem});
  Future<bool> deleteItem({required String deleteItemId});
}
