// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/config/di.dart';
import '/datasources/service_remote_datasource.dart';
import '/models/service_model.dart';

final serviceRemoteDatasourceProvider = Provider<ServiceRemoteDatasource>((
  ref,
) {
  return getIt.get<ServiceRemoteDatasource>();
});

final serviceRepoProvider = Provider<ServiceRepo>((ref) {
  final serviceRemoteDatasource = ref.read(serviceRemoteDatasourceProvider);
  final internetConnectionChecker = getIt.get<InternetConnectionChecker>();
  return ServiceRepo(
    serviceRemoteDatasource: serviceRemoteDatasource,
    internetConnectionChecker: internetConnectionChecker,
  );
});

class ServiceRepo {
  final InternetConnectionChecker internetConnectionChecker;
  final ServiceRemoteDatasource serviceRemoteDatasource;
  ServiceRepo({
    required this.internetConnectionChecker,
    required this.serviceRemoteDatasource,
  });

  Future<List<ServiceModel>?> getAll() async {
    if (await internetConnectionChecker.hasConnection) {
      List<dynamic>? serversList = await serviceRemoteDatasource
          .getAll();
      if (serversList != null) {
        List<ServiceModel>? services = List.generate(serversList.length, (
          index,
        ) {
          return ServiceModel.fromMap(serversList[index]);
        });
        return services;
      }
            return null;

    }
    throw Exception('No internet connection');
  }

  Future<ServiceModel?> getOne({required String itemId}) async {
    if (await internetConnectionChecker.hasConnection) {
      Map<String, dynamic>? serverMap = await serviceRemoteDatasource.getOne(
        itemId: itemId,
      );
      if (serverMap != null) {
        ServiceModel? server = ServiceModel.fromMap(serverMap);
        return server;
      }
      return null;
    }
    throw Exception('No internet connection');
  }
}
