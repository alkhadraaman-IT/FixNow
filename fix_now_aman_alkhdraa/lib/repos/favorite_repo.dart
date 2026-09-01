// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fix_now_aman_alkhdraa/models/services_model.dart';

import '/datasources/favorite_local_datasource.dart';

class FavoriteRepo {
  FavoriteLocalDatasource favoriteLocalDatasource;
  FavoriteRepo({required this.favoriteLocalDatasource});

  List<ServicesModel> getFavoreteServites() {
    return favoriteLocalDatasource.getFavoreteServites();
  }

  toggleFavorite({required ServicesModel service}) async {
    return await favoriteLocalDatasource.toggleFavorite(service: service);
  }
}
