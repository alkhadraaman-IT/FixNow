import 'dart:async';

import '/core/provider/user_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repos/auth_repo.dart';

final userSessionProvider =
    AsyncNotifierProvider<UserSessionProvider, UserSessionState>(() {
      return UserSessionProvider();
    });

class UserSessionProvider extends AsyncNotifier<UserSessionState> {
  @override
  Future<UserSessionState> build() async {
    print('<<<<<<<<<<<<<< build UserSessionProvider >>>>>>>>>>>>>>>>');

    //final viewOnboarding = await ref.read(authRepoProvider).completeOnboarding();
    final authenticated = await ref.read(authRepoProvider).restoreSession();
    final isviewOnboarding = await ref
        .read(authRepoProvider)
        .isCompleteOnboarding();
    UserSessionState userSessionState = UserSessionState(
      authenticated: authenticated,
      // viewOnboarding: viewOnboarding,
      isviewOnboarding: isviewOnboarding,
    );
    print('userSessionState::::::::::$userSessionState');
    return userSessionState;
  }
}
