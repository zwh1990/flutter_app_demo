import 'package:flutter_app_demo/constant/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static String token = "";

  static Future getToken() async {
    if (token == null || token.isEmpty) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Strings.TOKEN) ?? null;
    }
    return token;
  }
}
