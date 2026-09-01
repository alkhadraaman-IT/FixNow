// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../models/services_model.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteLocalDatasource {
  Box box;
  FavoriteLocalDatasource({required this.box});

  List<ServicesModel> getFavoreteServites() {
    List<dynamic> favoriteData = box.values.toList();
    List<ServicesModel> favoriteServites = List.generate(favoriteData.length, (
      index,
    ) {
      return ServicesModel.fromMap(favoriteData[index]);
    });

    return favoriteServites;
  }

  toggleFavorite({required ServicesModel service}) async {
    List<dynamic> favoriteData = box.values.toList();
    List<ServicesModel> favoriteServites = List.generate(favoriteData.length, (
      index,
    ) {
      return ServicesModel.fromMap(favoriteData[index]);
    });
    bool isCurrentlyFavorite = favoriteServites.any((element) {
      return element.id == service.id;
    });
    if (isCurrentlyFavorite) {
      await box.delete(service.id);
      
    } else {
      box.put(service.id, service.toMap());
    }
  }
}
