import 'package:fix_now_aman_alkhdraa/datasources/favorite_local_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../core/constants/app_key.dart';
import '/models/service_model.dart';
import '/repos/favorite_repo.dart';

final favoriteProvider =
    AsyncNotifierProvider<FavoriteProvider, List<ServiceModel>>(() {
      return FavoriteProvider(
        favoriteBox: Hive.box(AppKeys.favoriteBoxKey),
        favoriteRepo: FavoriteRepo(//* لازم استخدم FavoriteRepoProvider
          favoriteLocalDatasource: FavoriteLocalDatasource(
            favoriteBox: Hive.box(AppKeys.favoriteBoxKey),
          ),
        ),
      );
    });

class FavoriteProvider extends AsyncNotifier<List<ServiceModel>> {
  final Box<ServiceModel> favoriteBox;
  final FavoriteRepo _favoriteRepo;
  FavoriteProvider({required this.favoriteBox, required this._favoriteRepo});

  @override
  Future<List<ServiceModel>> build() async {
    List<ServiceModel> favoriteServites = _favoriteRepo.getFavoreteServites();
    return favoriteServites;
  }

  Future<void> toggleFavorite({required ServiceModel service}) async {
    await _favoriteRepo.toggleFavorite(service: service);
    bool isCurrentlyFavorite = favoriteBox.values.any((element) {
      return element == service.id;
    });
    List<ServiceModel> favoriteServites = state.value!;
    if (isCurrentlyFavorite) {
      favoriteServites = favoriteServites.where((element) {
        return element.id != service.id;
      }).toList();
    } else {
      favoriteServites = [...favoriteServites, service];
      state = AsyncData(favoriteServites);
    }

    bool isFavoriteService(ServiceModel service) {
      bool isFavorite = state.value!.any((element) {
        return element.id == service.id;
      });
      return isFavorite;
    }
  }
}
