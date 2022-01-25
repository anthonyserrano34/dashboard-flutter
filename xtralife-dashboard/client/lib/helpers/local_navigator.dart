import '/controllers/controllers.dart';
import '/routing/router.dart';
import '/routing/routes.dart';
import 'package:flutter/widgets.dart';

Navigator localNavigator() => Navigator(
    key: navigationController.navigationKey,
    initialRoute: StatusPageRoute,
    onGenerateRoute: generateRoute);
