import 'package:fix_now_aman_alkhdraa/core/config/di.dart';
import 'package:fix_now_aman_alkhdraa/models/services_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/service_remote_datasource.dart';

// final serviceRemoteDatasourceProvider = Provider<ServiceRemoteDatasource>((ref) {
//   return getIt.get<ServiceRemoteDatasource>();
// });


// final ServiceProvider =
//     AsyncNotifierProvider<ServiceAsyncNotifierProvider, List<ServicesModel>>(() {
//       return ServiceAsyncNotifierProvider();
//     });


// class ServiceAsyncNotifierProvider extends AsyncNotifier<List<ServicesModel>> {
//   @override
//   Future<List<ServicesModel>> build() async {
//     var servicesServices = ref.read(serviceRemoteDatasourceProvider);
//     List<ServicesModel>? services = await serviceRemoteDatasourceProvider.getAll();
//     if (services == null) {
//       throw Exception("failed to fecth data.");
//     }
//     return services;
//   }
// }

List<ServicesModel> list = [
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 1,
      ),
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 2,
      ),
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 3,
      ),
    ];
    
final serviceProvider = Provider<List<ServicesModel>>((ref) {
  // List<ServicesModel> service = List.generate(
  //   list.length,
  //   (index) => ServicesModel.fromMap(list[index]),
  // );
  return list;
});
