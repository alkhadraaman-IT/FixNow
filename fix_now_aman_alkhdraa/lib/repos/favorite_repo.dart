// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/models/service_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/datasources/favorite_local_datasource.dart';

final favoriteRepoProvider = Provider((ref) {
  return favoriteLocalDatasourceProvider;
});

class FavoriteRepo {
  FavoriteLocalDatasource favoriteLocalDatasource;
  FavoriteRepo({required this.favoriteLocalDatasource});

  List<ServiceModel> getFavoreteServites() {
    return favoriteLocalDatasource.getFavoreteServites();
  }

  toggleFavorite({required ServiceModel service}) async {
    return await favoriteLocalDatasource.toggleFavorite(service: service);
  }
}
