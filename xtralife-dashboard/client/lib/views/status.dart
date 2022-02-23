import 'package:dashboard/constants.dart';
import 'package:dashboard/providers/domain_provider.dart';
import 'package:dashboard/providers/game_provider.dart';
import 'package:dashboard/services/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<StatusPage> {
  bool showStorage = false;
  Widget build(BuildContext context) {
    getGameStorage(context.watch<Game>().game, context.watch<Domain>().domain);

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
                                      InkWell(
                                        onTap: () {
                                          if (showStorage == true) {
                                            setState(() {
                                              showStorage = false;
                                            });
                                          } else {
                                            setState(() {
                                              showStorage = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                            color: Colors.black38,
                                            width: 120,
                                            height: 50,
                                            child: Center(child: Text("Edit"))),
                                      ),
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
                                          child: Center(child: Text("Import"))),
                                    ])),
                          ))
                    ],
                  )),
              showStorage ? Storage() : SizedBox(),
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

  Widget Storage() {
    return Container(
        decoration: BoxDecoration(
          color: thirdColor,
        ),
        height: 150,
        width: 1000,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 850,
            height: 52,
            child: TextField(
              style: TextStyle(color: secondaryColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter Key Name and press 'Add new key'",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
              color: Colors.green,
              width: 120,
              height: 50,
              child: Center(child: Text("+ Add new key")))
        ]));
  }
}
