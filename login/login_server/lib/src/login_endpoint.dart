import 'generated/protocol.dart';
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