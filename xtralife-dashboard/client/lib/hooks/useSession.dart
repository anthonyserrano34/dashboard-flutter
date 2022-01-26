import 'dart:convert';
import 'package:dashboard/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<String?> login(String username, String password) async {
  print("Attempting to login");
  final data = jsonEncode({'username': username, 'password': password});
  var url = Uri.parse("/login");
  http.post(url,
      body: data,
      headers: {"Content-Type": "application/json"}).then((res) async {
    print("Response status: ${res.statusCode}");
    print("Response body: ${res.body}");
    if (res.statusCode == 200) {
      print("Authenticated !");
      Get.toNamed("/dashboard");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
      ;
      return res.body;
    }
    return null;
  });
}

Future<String?> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('username');
  Get.toNamed("/login");
}

Future<String?> checkLoggedin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  print(Get.currentRoute);
  if (Get.currentRoute != '/login' && username == null) {
    Get.toNamed("/login");
    print("You must be logged in to view the dashboard.");
  } else if (Get.currentRoute == '/login' && username != null) {
    Get.offNamed("/dashboard");
    print("You are already logged in. Back to the dashboard.");
  }
}
