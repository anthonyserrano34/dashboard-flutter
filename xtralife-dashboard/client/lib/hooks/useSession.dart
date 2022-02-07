import 'dart:convert';
import 'package:dashboard/context/app-context.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<String?> login(String username, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("Attempting to login");
  final data = jsonEncode({'username': username, 'password': password});
  var url = Uri.parse("http://127.0.0.1:3000/login");
  http.post(url,
      body: data,
      headers: {"Content-Type": "application/json"}).then((res) async {
    print("Response status: ${res.statusCode}");
    print("Response body: ${res.body}");
    if (res.statusCode == 200 || 1 == 1) {
      Get.snackbar(
        "Welcome ${username} !",
        "You are successfully logged in.",
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      print("username = ${username}");
      prefs.setString('username', username);
      Get.toNamed("/dashboard");
      UserDetails userDetails = UserDetails.fromJson(jsonDecode(res.body));
      prefs.setString('game', jsonEncode(userDetails.games));
      String? game1 = prefs.getString('game');
      print("game1 ${game1![0]}");
      print("setUser : ${userDetails}");
      String? test = jsonEncode(userDetails.games![1]);
      Map test2 = jsonDecode(test);
      print("setGame : ${test2['domains']}");
      print("setDomain : ${userDetails.games![0].domains![0]}");
      return res.body;
    }
    return null;
  });
}

Future<String?> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('username');
  Get.toNamed("/login");
  Get.snackbar(
    "Good bye !",
    "You have been logged out successfully.",
    icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

Future<String?> checkLoggedin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  print(Get.currentRoute);

  if (Get.currentRoute == '/dashboard' && username == null) {
    Get.toNamed("/login");
    Get.snackbar(
      "Error.",
      "You need to login first before you can access the dashboard.",
      icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  } else if (Get.currentRoute == '/login' && username != null) {
    Get.offNamed("/dashboard");
    Get.snackbar(
      "Error.",
      "You are already logged in. Back to the dashboard.",
      icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  } else if (Get.currentRoute == '/' && username != null) {
    Get.toNamed("/dashboard");
  }
}
