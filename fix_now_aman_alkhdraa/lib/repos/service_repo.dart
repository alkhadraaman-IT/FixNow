// import '/datasources/service_remote_datasource.dart';

// import '/models/service_model.dart';

// class ServiceRepo {
//   ServiceRemoteDatasource serviceRemoteDatasource;
//   ServiceRepo({required this.serviceRemoteDatasource});

//   Future<List<ServiceModel>?> getAll() async {
//     List<Map<String, dynamic>>? serversList = await serviceRemoteDatasource
//         .getAll();
//     if (serversList != null) {
//       List<ServiceModel>? services = List.generate(serversList.length, (
//         int index,
//       ) {
//         return ServiceModel.fromMap(serversList[index]);
//       });
//       return services;
//     }
//     return null;
//   }

//   Future<ServiceModel?> getOne({required String itemId}) async {
//     Map<String, dynamic>? serverMap = await serviceRemoteDatasource.getOne(
//       itemId: itemId,
//     );
//     if (serverMap != null) {
//       ServiceModel? server = ServiceModel.fromMap(serverMap);
//       return server;
//     }
//     return null;
//   }
// }
