import 'dart:async';

import 'package:fix_now_aman_alkhdraa/core/config/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/user_model.dart';
import '/repos/user_repo.dart';

final userProvider = AsyncNotifierProvider<UserProvider, UserModel>(() {
  return UserProvider(
    userRepo: UserRepo(
      internetConnectionChecker: getIt.get<InternetConnectionChecker>(),
    ),
  );
});

class UserProvider extends AsyncNotifier<UserModel> {
  UserRepo _userRepo;
  UserProvider({required this._userRepo});
  @override
  Future<UserModel> build() async {
    print('<<<<<<<<<<<<<< build UserProvider >>>>>>>>>>>>>>>>');

    UserModel? user = await _userRepo.getOne();

    if (user == null) {
      throw Exception('faild fetch data');
    }
    return user;
  }
}
