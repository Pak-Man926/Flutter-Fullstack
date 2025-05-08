import "package:flutter/material.dart";
import "package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart";
//import "package:myproject_server/src/server.dart";


import  "package:serverpod_client/serverpod_client.dart";

class AccountPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return ListView(
      children: [
        ListTile(
          contentPadding: 
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: CircularUserImage(
            userInfo: sessionManager.signedInUser,
            size: 42,
          )
        )
      ]
    );
  }
}