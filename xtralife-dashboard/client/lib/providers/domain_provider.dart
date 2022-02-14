import 'package:flutter/material.dart';

class Domain with ChangeNotifier {
  String _domain = "0";
  String get domain => _domain;

  void setDomain(newDomain) {
    _domain = newDomain;
    notifyListeners();
  }
}
