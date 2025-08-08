import "package:pixorama_client/pixorama_client.dart";
import "package:flutter/material.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";

import "package:pixorama_flutter/pixorama.dart";

var client = Client("http://$localhost:8080/")
  ..connectivityMonitor = FlutterConnectivityMonitor();


void main()
{
  runApp(PixoramaApp());
}

class PixoramaApp extends StatelessWidget
{
  const PixoramaApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pixorama",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: const Pixorama(),
      )
    );
  }
}