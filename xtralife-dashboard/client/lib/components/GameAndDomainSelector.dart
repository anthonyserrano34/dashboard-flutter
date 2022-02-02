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
  String gameSelected = 'Select a game';

  List data = [];

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

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  @override
  Widget build(BuildContext context) {
    print(gameSelected);
    return DropdownButton<String>(
      value: gameSelected,
      style: const TextStyle(color: primaryColor),
      items: data.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['name']),
          value: item.toString(),
        );
      }).toList(),
      onChanged: (newGame) {
        setState(() {
          gameSelected = newGame!;
        });
        print(newGame);
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

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: domainSelected,
      style: const TextStyle(color: primaryColor),
      onChanged: (String? newValue) {
        setState(() {
          domainSelected = newValue!;
        });
      },
      items: <String>['private', 'domain2', 'domain3']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
