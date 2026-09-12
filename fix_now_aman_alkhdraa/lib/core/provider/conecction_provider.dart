// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final conecctionProvider = AsyncNotifierProvider(() {
  return ConecctionProvider(
    internetConnectionChecker: InternetConnectionChecker.instance,
  );
});

class ConecctionProvider extends AsyncNotifier<void> {
  final InternetConnectionChecker internetConnectionChecker;
  ConecctionProvider({required this.internetConnectionChecker});

  Future<void> isConnection() async {
    print('<<<<<<<<<<<<<< isConnection >>>>>>>>>>>>>>>>');

    bool isConnection = await internetConnectionChecker.hasConnection;
    if (isConnection) {
      state = AsyncData(null);
    }
  }

  @override
  Future<void> build() async {
    print('<<<<<<<<<<<<<< build ConecctionProvider >>>>>>>>>>>>>>>>');
  }
}
