import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
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
              Icon(Icons.leaderboard, size: 35),
              SizedBox(width: 20),
              Text('Leaderboards', style: TextStyle(fontSize: 35))
            ],
          ),
        ),
      ]),
    );
  }
}
