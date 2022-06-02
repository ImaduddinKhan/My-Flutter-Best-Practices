import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poc_current_address/alert.dart';
import 'package:poc_current_address/api.dart';
import 'package:poc_current_address/loc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _latitude = 0.0;
  double _longitude = 0.0;
  String _city = '';

  String message = 'test';

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () => alert('Hello!! from JS'),
              child: const Text('Alert in Flutter Web'),
            ),
            OutlinedButton(
              onPressed: () {
                getCurrentPosition(
                  allowInterop(
                    (pos) {
                      setState(
                        () {
                          _latitude = pos.coords.latitude;
                          _longitude = pos.coords.longitude;
                        },
                      );
                    },
                  ),
                );
              },
              child: const Text('Mozilla GeoLocation'),
            ),
            Text('LAT : $_latitude'),
            Text('LONG : $_longitude'),
            OutlinedButton(
              onPressed: () async {
                final _val = await LocationAPI().fetchData();
                setState(() => _city = _val);
              },
              child: const Text('Location from API'),
            ),
            Text('CITY : $_city'),
          ],
        ),
      ),
    );
  }
}
