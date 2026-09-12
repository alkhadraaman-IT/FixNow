import '/core/constants/app_key.dart';
import '/core/models/user_session_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureSessionStorage {
  
  final FlutterSecureStorage secureSession;

  SecureSessionStorage({required this.secureSession});

  Future<void> saveSession({required UserSessionModel userSession}) async {
    await secureSession.write(
      key: AppKeys.accessTokenKey,
      value: userSession.accessToken,
    );
    print(' save session:${await secureSession.read(
      key: AppKeys.accessTokenKey,
    )}');
    // await secureSession.write(
    //   key: AppKeys.refreshTokenKey,
    //   value: userSession.refreshToken,
    // );
  }

  Future<UserSessionModel?> getSession() async {
    String? accessToken = await secureSession.read(key: AppKeys.accessTokenKey);
    // String? refreshToken = await secureSession.read(
    //   key: AppKeys.refreshTokenKey,
    // );
    // if (accessToken != null && refreshToken != null) {
    if (accessToken != null ) {
      UserSessionModel userSession = UserSessionModel(
        accessToken: accessToken,
        // refreshToken: refreshToken,
      );
      print('************$userSession');
      return userSession;
    }
    return null;
  }

  Future<void> clearSession() async {
    secureSession.delete(key: AppKeys.accessTokenKey);
    // secureSession.delete(key: AppKeys.refreshTokenKey);
  }
}
