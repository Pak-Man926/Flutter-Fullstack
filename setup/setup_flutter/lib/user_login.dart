import "package:flutter/material.dart";
import "package:setup_client/setup_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:setup_flutter/homepage.dart";

class Login extends StatefulWidget
{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> 
{
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  @override
  void dispose() 
  {
    contactNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void>_login() async
  {
    final contactNumber = int.tryParse(contactNumberController.text);
    final password = passwordController.text;

    if(contactNumber == null || password.isEmpty)
    {
      // Show error message
      return;
    }

    try
    {
      final result = await client.userEndpoints.loginUser(
        contactNumber,
        password,
      );

      if(result != null)
      {
        // Login successful
        print('User logged in successfully');
        // Navigate to the next screen or perform any other action
      }
      else
      {
        // Invalid credentials
        print('Invalid credentials');
      }
    }
    catch(e)
    {
      // Handle error
      print('Error: $e');
    }
  }  

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contactNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact Number',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Call to the endpoint to login user
               await _login();

               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Homepage(),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ]
        )
      )
    );
  }
}