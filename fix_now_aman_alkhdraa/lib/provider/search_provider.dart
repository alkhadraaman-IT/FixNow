import 'dart:async';

import '../repos/service_repo.dart';
import '/provider/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/service_model.dart';

final searchProvider = AsyncNotifierProvider(() {
  return SearchProvider();
});

class SearchProvider extends AsyncNotifier<SearchState> {
  @override
  Future<SearchState> build() async {
    print('<<<<<<<<<<<<<< build SearchProvider >>>>>>>>>>>>>>>>');

    List<ServiceModel>? searchResult = await ref
        .watch(serviceRepoProvider)
        .getAll();
    if (searchResult == null) {
      throw Exception('faild fetch data');
    }
    return SearchState(query: '', searchResult: searchResult);
  }

  Future<void> updateQuerySearch({required String query}) async {
    print('<<<<<<<<<<<<<< updateQuery >>>>>>>>>>>>>>>>');
    List<ServiceModel>? services = await ref
        .watch(serviceRepoProvider)
        .getAll();
    if (services == null) {
      throw Exception('faild fetch data');
    }

    List<ServiceModel> searchedServices = services.where((element) {
      return element.name!.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    SearchState searchResult = SearchState(
      query: query,
      searchResult: searchedServices,
    );
    print('searchResult:$searchResult');
    state = AsyncData(searchResult);
  }

  void clearSearch() async {
    print('<<<<<<<<<<<<<< clearSearch >>>>>>>>>>>>>>>>');

    List<ServiceModel>? searchedServices = await ref
        .watch(serviceRepoProvider)
        .getAll();
    if (searchedServices == null) {
      throw Exception('faild fetch data');
    }

    SearchState searchResult = SearchState(
      query: '',
      searchResult: searchedServices,
    );
    state = AsyncData(searchResult);
  }
}
