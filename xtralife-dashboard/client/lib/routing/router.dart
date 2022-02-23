import '../views/main/home.dart';
import '../views/leaderboards.dart';
import '../views/status.dart';
import '../views/store.dart';
import '../views/users.dart';
import '../views/main/home.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainPageRoute:
      return _getPageRoute(HomeScreen());
    case StatusPageRoute:
      return _getPageRoute(StatusPage());
    case StorePageRoute:
      return _getPageRoute(StorePage());
    case UsersPageRoute:
      return _getPageRoute(UsersPage());
    case LeaderboardPageRoute:
      return _getPageRoute(LeaderboardPage());
    default:
      return _getPageRoute(StatusPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
