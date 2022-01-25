import '/pages/login/login.dart';
import '/pages/status/status.dart';
import '/pages/store/store.dart';
import '/pages/users/users.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StatusPageRoute:
      return _getPageRoute(StatusPage());
    case StorePageRoute:
      return _getPageRoute(StorePage());
    case UsersPageRoute:
      return _getPageRoute(UsersPage());
    case LoginPageRoute:
      return _getPageRoute(LoginPage());
    default:
      return _getPageRoute(StatusPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
