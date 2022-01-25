import '/controllers/controllers.dart';
import '/routing/routes.dart';
import '/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                Text("Dashboard")
              ],
            ),
          ),
          DrawerListTile(
            title: "Status",
            icon: Icons.dashboard_outlined,
            press: () {
              navigationController.navigateTo(StatusPageRoute);
            },
          ),
          DrawerListTile(
            title: "Store",
            icon: Icons.local_grocery_store_outlined,
            press: () {
              navigationController.navigateTo(StorePageRoute);
            },
          ),
          DrawerListTile(
            title: "Users",
            icon: Icons.manage_accounts_outlined,
            press: () {
              navigationController.navigateTo(UsersPageRoute);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(icon, color: primaryColor, size: 16),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
