import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';

class GameAndDomainSelector extends StatelessWidget {
  const GameAndDomainSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Game :"),
        SizedBox(
          width: 30,
        ),
        GameSelector(),
        SizedBox(
          width: 30,
        ),
        Text("Domain :"),
        SizedBox(
          width: 30,
        ),
        DomainSelector(),
      ],
    ));
  }
}

class GameSelector extends StatefulWidget {
  const GameSelector({Key? key}) : super(key: key);

  @override
  State<GameSelector> createState() => _GameSelectorState();
}

class _GameSelectorState extends State<GameSelector> {
  static List data = [];

  Future<String> getSWData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? game1 = prefs.getString('game');
    var resBody = json.decode(game1!);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "ok";
  }

  static String gameSelected = data[0].toString();
  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: gameSelected,
      icon: const Icon(Icons.keyboard_arrow_down),
      style: const TextStyle(color: primaryColor),
      items: data.map((item) {
        return DropdownMenuItem(
          child: Text(item['name']),
          value: item.toString(),
        );
      }).toList(),
      onChanged: (newGame) {
        setState(() {
          gameSelected = newGame!;
        });
        print(gameSelected);
      },
    );
  }
}

class DomainSelector extends StatefulWidget {
  const DomainSelector({Key? key}) : super(key: key);

  @override
  State<DomainSelector> createState() => _DomainSelectorState();
}

class _DomainSelectorState extends State<DomainSelector> {
  String domainSelected = 'private';
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
