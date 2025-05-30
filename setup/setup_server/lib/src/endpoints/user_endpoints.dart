import "dart:async";

import "package:serverpod/serverpod.dart";
import "package:setup_server/src/generated/user_models.dart";

class UserEndpoints extends Endpoint 
{
  Future<bool> registerUser(Session session, String firstName, String lastName, int contacts, String email, String password) async
  {
    var existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts),
    );

    if (existingUser != null) {
      return false; // User already exists
    }
    // Create a new user


    final user = User(
      firstName:firstName,
      lastName: lastName,
      contacts: contacts,
      email: email,
      password: password, 
    );

    await User.db.insertRow(session, user);

    return true;
  }

  Future<User?> loginUser(Session session, int contacts, String password) async
  {
    // Find the user with the given contacts and password
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts) & t.password.equals(password),
    );

    if (user == null) {
      return null; // Invalid credentials
    }

    return user; // Return the found user
  }
  
}
