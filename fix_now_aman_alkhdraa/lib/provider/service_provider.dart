import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/config/di.dart';
import '/models/service_model.dart';
import '/repos/service_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/service_remote_datasource.dart';

final serviceProvider =
    AsyncNotifierProvider<ServiceAsyncNotifierProvider, List<ServiceModel>>(() {
      return ServiceAsyncNotifierProvider(
        serviceRepo: ServiceRepo(
          serviceRemoteDatasource: ServiceRemoteDatasource(
            dio: Dio(),
            secureStorage: FlutterSecureStorage(),
          ),
          internetConnectionChecker: getIt.get<InternetConnectionChecker>(),
        ),
      );
    });

class ServiceAsyncNotifierProvider extends AsyncNotifier<List<ServiceModel>> {
  final ServiceRepo _serviceRepo;

  ServiceAsyncNotifierProvider({required this._serviceRepo});

  @override
  Future<List<ServiceModel>> build() async {
    print('<<<<<<<<<<<<<< build ServiceAsyncNotifierProvider >>>>>>>>>>>>>>>>');

    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // var services = ref.read(_serviceRepo);
    print("v==========================================================");
    List<ServiceModel>? servicesResult = await _serviceRepo.getAll();

    if (servicesResult == null) {
      throw Exception("failed to fecth data.");
    }
    return servicesResult;
  }
}
