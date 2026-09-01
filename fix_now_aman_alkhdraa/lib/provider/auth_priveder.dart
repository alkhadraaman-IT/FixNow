//! الخطأ انو ما عرفت استخدم الAuthRepo

// import 'dart:async';

// import '/models/login_model.dart';

// import '/repos/auth_repo.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authRepo = Provider((ref) {
//   return AuthRepo();
// });

// class AuthPriveder extends AsyncNotifier<void> {
//   @override
//   Future<void> build() async {}

//   Future<void> login({required LoginModel loginInfo}) async {
//     state = AsyncLoading();

//     try {
//       bool isLoged = await authRepo.login(loginInfo: loginInfo);
//       if (!isLoged) {
//         state = AsyncError('check your data', StackTrace.current);
//       }
//       return;
//     } catch (e, stack) {
//       state = AsyncError(e, stack);
//     }
//   }
// }
