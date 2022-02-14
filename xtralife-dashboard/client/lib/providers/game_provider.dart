import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  late String _game;
  String get game => _game;

  void setGame(newGame) {
    _game = newGame;
    notifyListeners();
  }
}
