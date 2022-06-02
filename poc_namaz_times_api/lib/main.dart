import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:poc_namaz_times_api/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.list}) : super(key: key);
  Namaz? list;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String url =
      "https://api.aladhan.com/v1/timingsByCity?city=Barikot&country=Pakistan&method=4";

  Future getData() async {
    http.Response result = await http.get((Uri.parse(url)), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml:q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(result.body);

    widget.list = await Namaz.fromJson(data);

    if (kDebugMode) {
      print(widget.list!.data.timings.fajr.toString());
    }

    return widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Namaz Timings'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    snapshot.data.data.timings.fajr.toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  // Text(
                  //   snapshot.data.data.timings.dhuhr.toString(),
                  //   style: Theme.of(context).textTheme.displayLarge,
                  // ),
                  // Text(
                  //   snapshot.data.data.timings.asr.toString(),
                  //   style: Theme.of(context).textTheme.displayLarge,
                  // ),
                  // Text(
                  //   snapshot.data.data.timings.maghrib.toString(),
                  //   style: Theme.of(context).textTheme.displayLarge,
                  // ),
                  // Text(
                  //   snapshot.data.data.timings.isha.toString(),
                  //   style: Theme.of(context).textTheme.displayLarge,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
