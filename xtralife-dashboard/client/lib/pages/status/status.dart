import 'package:dashboard/constants.dart';
import 'package:dashboard/providers/domain_provider.dart';
import 'package:dashboard/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.signal_wifi_statusbar_connected_no_internet_4,
                    size: 35),
                SizedBox(width: 20),
                Text('Status', style: TextStyle(fontSize: 35))
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  height: 90,
                  width: 1000,
                  child: Row(
                    children: [
                      Container(
                          width: 500,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text("Key/Value storage",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                  "Your game is not using Key/Value storage in domain ${context.watch<Domain>().domain}"),
                            ),
                          ])),
                      Spacer(),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                                height: 50,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          color: Colors.black38,
                                          width: 120,
                                          height: 50,
                                          child: Center(child: Text("Edit"))),
                                      SizedBox(width: 10),
                                      Container(
                                          color: Colors.green,
                                          width: 120,
                                          height: 50,
                                          child: Center(child: Text("Import")))
                                    ])),
                          ))
                    ],
                  )),
              SizedBox(height: 100),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  height: 90,
                  width: 1000,
                  child: Row(
                    children: [
                      Container(
                          width: 500,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text("Achievements definition",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                  "You have not defined achievements in domain private yet"),
                            ),
                          ])),
                      Spacer(),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                                height: 50,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          color: Colors.black38,
                                          width: 120,
                                          height: 50,
                                          child: Center(child: Text("Edit"))),
                                      SizedBox(width: 10),
                                      Container(
                                          color: Colors.blue,
                                          width: 120,
                                          height: 50,
                                          child: Center(child: Text("Export"))),
                                      SizedBox(width: 10),
                                      Container(
                                          color: Colors.green,
                                          width: 120,
                                          height: 50,
                                          child: Center(child: Text("Import")))
                                    ])),
                          )),
                    ],
                  ))
            ],
          )))
        ]));
  }
}
