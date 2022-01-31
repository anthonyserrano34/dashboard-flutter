import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';
import 'screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:flutter/foundation.dart';
import '/screens/login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  username = "user";
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/dashboard', page: () => MainScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
    ],
    debugShowCheckedModeBanner: false,
    title: 'XL Dashboard',
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgColor,
      canvasColor: secondaryColor,
    ),
    home: (username == null ? LoginScreen() : MainScreen()),
  ));
}
