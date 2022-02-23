import 'dart:convert';
import 'package:dashboard/context/app-context.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future getGameStorage(game, domain) async {
  try {
    print("Attempting to load storage");
    var url = Uri.parse("http://localhost:3000/game/${game}/storage/${domain}");
    http.get(url).then((res) async {
      if (res.statusCode == 200 && res.body == "") {
        print("vide");
        return [];
      }
      print("Game : ${game}");
      print("Domain : ${domain}");
      print("res : ${res.body}");
      return res.body;
    });
  } catch (e) {
    print("Error while loading storage. See console for more.");
    return print(e);
  }
}
