import 'package:shared_preferences/shared_preferences.dart';

class CommonUtils {
  // Save value in SharedPreferences based on its type
  static Future<void> savePref(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else {
      prefs.setString(key, value.toString());
    }
  }

  // Get value from SharedPreferences based on its type (generic function)
  static Future<dynamic> getPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  // Get a boolean value
  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // Reload the SharedPreferences
  static Future<void> reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
  }

  // Clear all preferences
  static Future<void> clearPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // Remove a specific key from SharedPreferences
  static Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
