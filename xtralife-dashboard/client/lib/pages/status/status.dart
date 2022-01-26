import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var username;

void getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  username = prefs.getString('username');
}

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getUsername();
    return Center(child: Text("Status, hello ${username}"));
  }
}
