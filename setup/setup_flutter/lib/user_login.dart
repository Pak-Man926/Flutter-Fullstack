import "package:flutter/material.dart";

class Login extends StatefulWidget
{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> 
{
  
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact Number',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call to the endpoint to login user
              },
              child: Text('Login'),
            ),
          ]
        )
      )
    );
  }
}