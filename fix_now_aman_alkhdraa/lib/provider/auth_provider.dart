import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/login_model.dart';
import '/repos/auth_repo.dart';

// final authRepo = Provider((ref) {
//   return AuthRepo();
// });

final authPriveder = AsyncNotifierProvider<AuthProvider, void>(() {
  // final authRepo = ref.read(authRepoProvider);
  return AuthProvider();
});

class AuthProvider extends AsyncNotifier<void> {
  // AuthRepo authRepo;
  // AuthPriveder({required this.authRepo});
  @override
  Future<void> build() async {
    print('<<<<<<<<<<<<<< build authProvider >>>>>>>>>>>>>>>>');
  }

  Future<void> login({required LoginModel loginInfo}) async {
    state = AsyncLoading();
    print('<<<<<<<<<<<<<< login >>>>>>>>>>>>>>>>');

    try {
      bool isLoged = await ref
          .read(authRepoProvider)
          .login(loginInfo: loginInfo);
      if (!isLoged) {
        state = AsyncError('check your data', StackTrace.current);
      }
      state=AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> logout() async {
    try {
      print('<<<<<<<<<<<<<< logout >>>>>>>>>>>>>>>>');

      state = AsyncLoading();
      bool isLoged = await ref.read(authRepoProvider).logout();
      
      if (isLoged) {
        state = AsyncError('error try again', StackTrace.current);
      }
      state=AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> isCompleteOnboarding() async {
    try {
      print('<<<<<<<<<<<<<< isCompleteOnboarding >>>>>>>>>>>>>>>>');

      state = AsyncLoading();
      final bool isCompleteOnboarding = await ref
          .read(authRepoProvider)
          .isCompleteOnboarding();

      if (isCompleteOnboarding == true) {
        state = AsyncData(isCompleteOnboarding);
      }
      state=AsyncData(null);
    } catch (e, stack) {
      print(e);
      state = AsyncError(e, stack);
    }
  }

  Future<void> completeOnboarding() async {
    try {
      print('<<<<<<<<<<<<<< completeOnboarding >>>>>>>>>>>>>>>>');

      state = AsyncLoading();
      await ref.read(authRepoProvider).completeOnboarding();
      state = AsyncData(null);
    } catch (e, stack) {
      print(e);
      state = AsyncError(e, stack);
    }
  }
}
