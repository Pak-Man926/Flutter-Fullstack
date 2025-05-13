import "dart:async";

import "package:serverpod/serverpod.dart";
import "package:serverpod/src/generated/protocol.dart";

class UserEndpoints extends Endpoint 
{
  Future<User> registerUser(Session session, String firstName, String lastName, int contacts, String email, String password) async
  {
    
  }
}
