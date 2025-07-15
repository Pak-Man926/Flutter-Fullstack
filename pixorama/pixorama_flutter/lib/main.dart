import "package:pixorama_client/pixorama_client.dart";
import "package:flutter/material.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";

import "src/pixorama.dart";

var client = Client("http://$localhost:8080/")
  ..connectivityMonitor = FlutterConnectivityMonitor();


void main()
{
  runApp(PixoramaApp());
}

class PixoramaApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Pixorama",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(appBar: ,)
    );
  }
}