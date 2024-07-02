import 'package:absent_payroll/src/core/base_import.dart';

class AuthUtils {
  static final String _skLogin = 'is_login';
  static final String _skMobileToken = 'token';
  static final String _skFCMToken = 'fcm_token';

  static Future<bool> isLoggedIn() async {
    return (await SettingsUtils.getString(_skMobileToken)) != "";
  }

  static setLoggedIn(bool status) async {
    return await SettingsUtils.setBool(_skLogin, status);
  }

  static Future<String> getAppToken() async {
    return await SettingsUtils.getString(_skMobileToken);
  }

  static Future<bool> setMobileToken(String token) async {
    setLoggedIn(true);
    await SettingsUtils.set(_skMobileToken, token);
    return true;
  }

  static Future<bool> removeSession() async {
    await SettingsUtils.remove(_skMobileToken);
    await SettingsUtils.remove(_skLogin);

    // clear student data
    await SettingsUtils.remove("example");
    return true;
  }

  static Future<Null> setFCMToken(String? token) async {
    await SettingsUtils.set(_skFCMToken, token ?? '');
  }

  static Future<String> getFCMToken() async {
    return await SettingsUtils.getString(_skFCMToken);
  }
}
