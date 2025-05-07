import "package:flutter/material.dart";
import "package:myproject_flutter/main.dart";
import "package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart";
import "package:myproject_flutter/src/serverpod_client.dart";


class SignInPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Dialog(
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignInWithEmailButton(caller: client.modules.auth),
            ]
          )
        )
      )
    );
  }
}