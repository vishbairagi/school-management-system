










import 'common_utils.dart';

Future <String> getSharedPref({required String keyValue} ) async {
  String value =  await CommonUtils.getPref(keyValue) ?? '';
  return value;
}




Future<bool> isLogin({required String keyValue}) async {
  try {
    bool value = await CommonUtils.getPref(keyValue) ?? false; // Default to false if not found
    return value;
  } catch (e) {
    print('Error checking login state for $keyValue: $e');
    return false; // Default to false on error
  }
}
