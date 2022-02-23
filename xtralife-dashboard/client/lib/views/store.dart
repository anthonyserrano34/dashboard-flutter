import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
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
              Icon(Icons.local_grocery_store_outlined, size: 35),
              SizedBox(width: 20),
              Text('Store', style: TextStyle(fontSize: 35))
            ],
          ),
        ),
      ]),
    );
  }
}
