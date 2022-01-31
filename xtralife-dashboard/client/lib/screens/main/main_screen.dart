import 'package:dashboard/controllers/controllers.dart';
import 'package:dashboard/hooks/useSession.dart';
import 'package:dashboard/routing/router.dart';
import 'package:dashboard/routing/routes.dart';
import 'package:dashboard/screens/dashboard/dashboard_screen.dart';

import '/helpers/local_navigator.dart';
import '/responsive.dart';
import 'package:flutter/material.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //checkLoggedin();
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Container(
                child: SideMenu(),
              ),
            Expanded(
                child: Column(
              children: [
                DashboardScreen(),
                Expanded(
                    child: Navigator(
                        key: navigationController.navigationKey,
                        initialRoute: StatusPageRoute,
                        onGenerateRoute: generateRoute))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
