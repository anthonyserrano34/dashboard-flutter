import 'dart:convert';
import 'package:dashboard/providers/domain_provider.dart';
import 'package:dashboard/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';

class GameAndDomainSelector extends StatefulWidget {
  const GameAndDomainSelector({Key? key}) : super(key: key);
  @override
  State<GameAndDomainSelector> createState() => _GameAndSelectorState();
}

class _GameAndSelectorState extends State<GameAndDomainSelector> {
  static List games = [];
  static List domains = [];
  static late Map gameSelected;
  static late String domainSelected;

  Future getGameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('game');
    setState(() {
      games = json.decode(data!);
      domains = games[0]['domains'];
      gameSelected = games[0];
      domainSelected = gameSelected['domains'][0];
    });
    context.read<Game>().setGame(gameSelected['name']);
    context.read<Domain>().setDomain(domainSelected);
  }

  @override
  void initState() {
    super.initState();
    this.getGameData();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Game :"),
        SizedBox(
          width: 30,
        ),
        DropdownButton<dynamic>(
          value: gameSelected,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: const TextStyle(color: primaryColor),
          items: games.map((game) {
            return DropdownMenuItem(
              child: Text(game['name']),
              value: game,
            );
          }).toList(),
          onChanged: (newGame) {
            setState(() {
              gameSelected = newGame!;
              domains = gameSelected['domains'];
              domainSelected = domains[0];
            });

            context.read<Game>().setGame(gameSelected['name']);
            context.read<Domain>().setDomain(domainSelected);
          },
        ),
        SizedBox(
          width: 30,
        ),
        Text("Domain :"),
        SizedBox(
          width: 30,
        ),
        DropdownButton<dynamic>(
          value: domainSelected,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: const TextStyle(color: primaryColor),
          items: domains.map((domain) {
            return DropdownMenuItem(
              child: Text(domain),
              value: domain,
            );
          }).toList(),
          onChanged: (newDomain) {
            setState(() {
              domainSelected = newDomain!;
            });
            context.read<Domain>().setDomain(domainSelected);
          },
        ),
      ],
    );
  }
}
