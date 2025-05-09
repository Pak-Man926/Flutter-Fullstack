import 'package:serverpod/serverpod.dart';

class LoginEndpint extends Endpoint
{
  Future<Login> login(Session session, String username, String password) async
  {
    return Login(
      success: true,
      message: 'Login successful',
    );
  }
}

//import 'package:serverpod/serverpod.dart';

class RegisterEndpoint extends Endpoint {
  Future<Register> register(Session session, String username, String password,) async
   {
    // Here you would typically check if the username is already taken and
    // hash the password before storing it in the database.

    // For this example, we will just return a success message.
    return Register(
      success: true,
      message: 'Registration successful',
    );
  }
}