import "package:flutter/material.dart";
import "package:setup_client/setup_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:setup_flutter/user_login.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final contactNumber = int.tryParse(contactNumberController.text);
    final password = passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        contactNumber == null ||
        password.isEmpty) {
      // Show error message
      return;
    }

    try {
      final result = await client.userEndpoints.registerUser(
        firstName,
        lastName,
        contactNumber,
        email,
        password,
      );

      // if (result == true) {
      //   // Registration successful
      //   print('User registered successfully');
      // } else {
      //   // Registration failed
      //   print("User registration failed!")
      // }
    } 
    catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
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
              onPressed: () {
                //Call to the endpoint to register user
                _register();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
