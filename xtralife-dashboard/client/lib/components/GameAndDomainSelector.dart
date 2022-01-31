import '/responsive.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class GameAndDomainSelector extends StatelessWidget {
  const GameAndDomainSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Spacer(flex: 1),
        GameSelector(),
        SizedBox(
          //Use of SizedBox
          width: 30,
        ),
        DomainSelector(),
        Spacer(flex: 1),
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
  String gameSelected =
      'com.xtralife.cloud';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: gameSelected,
      style: const TextStyle(color: primaryColor),
      underline: Container(
        height: 2,
        color: primaryColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          gameSelected = newValue!;
        });
      },
      items: <String>[
        'com.xtralife.cloud',
        'game2',
        'game3'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
      elevation: 16,
      style: const TextStyle(color: primaryColor),
      underline: Container(
        height: 2,
        color: primaryColor,
      ),
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
