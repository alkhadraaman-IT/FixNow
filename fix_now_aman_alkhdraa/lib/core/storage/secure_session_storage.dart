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
    // await secureSession.write(
    //   key: AppKeys.refreshTokenKey,
    //   value: userSession.refreshToken,
    // );
  }

  Future<UserSessionModel?> getSession() async {
    String? accessToken = await secureSession.read(key: AppKeys.accessTokenKey);
    String? refreshToken = await secureSession.read(
      key: AppKeys.refreshTokenKey,
    );
    if (accessToken != null && refreshToken != null) {
      UserSessionModel userSession = UserSessionModel(
        accessToken: accessToken,
        // refreshToken: refreshToken,
      );
      return userSession;
    }
    return null;
  }

  Future<void> clearSession() async {
    secureSession.delete(key: AppKeys.accessTokenKey);
    secureSession.delete(key: AppKeys.refreshTokenKey);
  }
}
