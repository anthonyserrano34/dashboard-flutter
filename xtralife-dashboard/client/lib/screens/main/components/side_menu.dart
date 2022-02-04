import '/hooks/useSession.dart';
import '/controllers/controllers.dart';
import '/routing/routes.dart';
import '/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            icon: Icons.signal_wifi_statusbar_connected_no_internet_4,
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
          DrawerListTile(
            title: "Leaderboards",
            icon: Icons.leaderboard,
            press: () {
              navigationController.navigateTo(UsersPageRoute);
            },
          ),
          DrawerListTile(
            title: "SDK",
            icon: Icons.widgets,
            press: () {
              _gotoSDK();
            },
          ),
          DrawerListTile(
            title: "Blog",
            icon: Icons.rss_feed,
            press: () {
              _gotoBlog();
            },
          ),
          DrawerListTile(
            title: "Logout",
            icon: Icons.exit_to_app,
            press: () async {
              await logout();
            },
          ),
        ],
      ),
    );
  }
}

void _gotoSDK() async {
  const url = 'https://github.com/xtralifecloud/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _gotoBlog() async {
  const url = 'https://xtralife.cloud/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
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
