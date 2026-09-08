import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../models/service_model.dart';

final favoriteLocalDatasourceProvider = Provider((ref) {
  return FavoriteLocalDatasource;
});

class FavoriteLocalDatasource {
  final Box<ServiceModel> favoriteBox;
  FavoriteLocalDatasource({required this.favoriteBox});

  List<ServiceModel> getFavoreteServites() {
    List<ServiceModel> favoriteServites = favoriteBox.values.toList();

    return favoriteServites;
  }

  toggleFavorite({required ServiceModel service}) async {
    List<ServiceModel> favoriteServites = favoriteBox.values.toList();
    bool isCurrentlyFavorite = favoriteServites.any((element) {
      return element.id == service.id;
    });
    if (isCurrentlyFavorite) {
      await favoriteBox.delete(service.id);
    } else {
      favoriteBox.put(service.id, service);
    }
  }
}
