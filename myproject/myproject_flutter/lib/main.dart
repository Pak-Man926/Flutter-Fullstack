//import 'package:myproject_client/myproject_client.dart';
import 'package:flutter/material.dart';
//import 'package:serverpod_flutter/serverpod_flutter.dart';
import "package:myproject_flutter/src/serverpod_client.dart";
import "package:myproject_flutter/src/widgets/sign_in_page.dart";

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  
  await initializeServerpodClient();

  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Serverpod Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: "Serverpod example"),
    );
  }
}

class HomePage extends StatefulWidget
{
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
      ),
      body: SignInPage(),
    );
  }
}
