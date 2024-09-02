import 'package:absent_payroll/src/api/index.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class AuthUtils {
  static const String _skLogin = 'is_login';
  static const String _skMobileToken = 'token';
  static const String _skFCMToken = 'fcm_token';

  static Future<ResultApi> doLogin(String userIdentifier, String password) async {
    var result = await LoginApi().request(email: userIdentifier, password: password);
    if (result.status) {
      var data = result.data as Login;
      await AuthUtils.setMobileToken(data.token);
      await setLoggedIn(true);
      await SettingsUtils.set("teacher_id", data.teacherId);
    }
    return result;
  }

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
