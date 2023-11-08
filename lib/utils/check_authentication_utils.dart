import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkAuthentication() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  bool isAuthenticated = token != null ? true : false;

  return isAuthenticated;
}
