// import 'dart:async';

// import '/repos/service_repo.dart';

// import '../models/service_model.dart';
// import '/provider/search_query_provider.dart';
// import '/provider/service_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // final SearchResultProvider = Provider<List<ServiceModel>>((ref) {
// //   List<ServiceModel> services = ref.watch(serviceProvider);
// //   String query = ref.watch(searchQueryProvider);
// //   if (query.trim().toLowerCase().isEmpty) {
// //     return services;
// //   }

// //   List<ServiceModel> searchedServices = services.where((element) {
// //     return element.name!.toLowerCase().contains(query.trim().toLowerCase());
// //   }).toList();
// //   return searchedServices;
// // });

// //!!! هي مو provider

// // final SearchResultProvider = AsyncNotifierProvider<ServiceAsyncNotifierProvider,List<ServiceModel>>(() {
// //   List<ServiceModel> services = ref.watch(serviceProvider);
// //   String query = ref.watch(searchQueryProvider);
// //   if (query.trim().toLowerCase().isEmpty) {
// //     return services;
// //   }

// //   List<ServiceModel> searchedServices = services.where((element) {
// //     return element.name!.toLowerCase().contains(query.trim().toLowerCase());
// //   }).toList();
// //   return searchedServices;
// // });

// final searchResultProvider =
//     AsyncNotifierProvider<SearchResultProvider, List<ServiceModel>>(() {
//       return SearchResultProvider();
//     });

// class SearchResultProvider extends AsyncNotifier<List<ServiceModel>> {
//   // List<ServiceModel> services = [];
//   @override
//   Future<List<ServiceModel>> build() async {
//     //!!?? ليش ما استدعيته من search provider
//     List<ServiceModel>? servicesResult = await ref
//         .watch(serviceRepoProvider)
//         .getAll();
//     if (servicesResult == null) {
//       throw Exception('faild fetch data');
//     }
//     return servicesResult;
//   }

//   List<ServiceModel> searchResult() {
//     String query = ref.watch(searchQueryProvider);

//     List<ServiceModel> searchedServices = state.value!.where((element) {
//       return element.name!.toLowerCase().contains(query.trim().toLowerCase());
//     }).toList();
//     return searchedServices;
//   }
// }
