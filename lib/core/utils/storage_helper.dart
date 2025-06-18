import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';
    static const _onboardingSeenKey = 'onboarding_seen';

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }



  static Future<bool> isOnboardingSeen() async {
    final seen = await _storage.read(key: _onboardingSeenKey);
    return seen == 'true';
  }

  static Future<void> setOnboardingSeen() async {
    await _storage.write(key: _onboardingSeenKey, value: 'true');
  }
}
