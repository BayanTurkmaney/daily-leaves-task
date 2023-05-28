import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {}

class AuthLocalImplWithSharedPref implements AuthLocalDataSource {
  static Future<void> setUser({String? res}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('user', res!);
  }

  Future<String?> getUser() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    return _prefs.getString('user');
  }

  static Future<void> setToken({String? token}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token!);
  }

  static Future<String?> getToken() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.getString('token');
  }
}
