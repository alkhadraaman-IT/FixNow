import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/login_model.dart';
import '/repos/auth_repo.dart';

// final authRepo = Provider((ref) {
//   return AuthRepo();
// });

final authPriveder = AsyncNotifierProvider<AuthPriveder, void>(() {
  // final authRepo = ref.read(authRepoProvider);
  return AuthPriveder();
});

class AuthPriveder extends AsyncNotifier<void> {
  // AuthRepo authRepo;
  // AuthPriveder({required this.authRepo});
  @override
  Future<void> build() async {}

  Future<void> login({required LoginModel loginInfo}) async {
    state = AsyncLoading();

    try {
      bool isLoged = await ref.read(authRepoProvider).login(loginInfo: loginInfo);
      if (!isLoged) {
        state = AsyncError('check your data', StackTrace.current);
      }
      return;
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> logout() async {
    try {
      state = AsyncLoading();
      bool isLoged = await ref.read(authRepoProvider).logout();
      if (isLoged) {
        state = AsyncError('error try again', StackTrace.current);
      }
      return;
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> isCompleteOnboarding() async {
    try {
      state = AsyncLoading();
      final bool isCompleteOnboarding = await ref.read(authRepoProvider).isCompleteOnboarding();

      if (isCompleteOnboarding==true) {
        state = AsyncData(isCompleteOnboarding);
      }
      return;
    } catch (e, stack) {
      print(e);
      state = AsyncError(e, stack);
    }
  }

  Future<void> completeOnboarding() async {
    try {
      state = AsyncLoading();
      await ref.read(authRepoProvider).completeOnboarding();
      state = AsyncData(null);
      return;
    } catch (e, stack) {
      print(e);
      state = AsyncError(e, stack);
    }
  }
}
