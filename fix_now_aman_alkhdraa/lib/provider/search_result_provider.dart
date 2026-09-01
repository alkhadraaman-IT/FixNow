import '../models/services_model.dart';
import '/provider/search_query_provider.dart';
import '/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SearchResultProvider = Provider<List<ServicesModel>>((ref) {
  List<ServicesModel> services = ref.watch(serviceProvider);
  String query = ref.watch(searchQueryProvider);
  if (query.trim().toLowerCase().isEmpty) {
    return services;
  }

  List<ServicesModel> searchedServices = services.where((element) {
    return element.name!.toLowerCase().contains(query.trim().toLowerCase());
  }).toList();
  return searchedServices;
});
