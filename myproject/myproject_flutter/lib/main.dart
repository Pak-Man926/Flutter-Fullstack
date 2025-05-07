import 'package:myproject_client/myproject_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import "package:myproject_flutter/src/serverpod_client.dart";

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  
  await initializeServerpodClient();

  runApp(constMyApp());
}

class MyApp extends StatelessWidget
{
  
}
