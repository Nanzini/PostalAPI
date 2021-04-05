import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopo Demo',
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String addressJSON = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kopo Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('find Korea Postal address'),
            onPressed: () async {
              final model = await Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Kopo(),
                ),
              );
              print(model);
              setState(() {
                addressJSON = model;
              });
            },
          ),
          Text('$addressJSON'),
        ],
      ),
    );
  }
}
