import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import "package:serverpod_auth_server/serverpod_auth_server.dart" as auth;
import 'package:mailer/mailer.dart';

import 'package:myproject_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async
    {
      final gmailEmail = session.serverpod.getPassword("gmailEmail");
      final gmailPassword = session.serverpod.getPassword("gmailPassword");
      // print("Validation code: $validationCode");

      if (gmailEmail == null || gmailPassword == null) {
        throw Exception('Gmail credentials are not set.');
      }
      final smtpServer = gmail(gmailEmail, gmailPassword);

      final message = Message()
        ..from = Address(gmailEmail)
        ..recipients.add(email)
        ..subject = "Validation Code"
        ..html = "Your verification code is: $validationCode";

        try{
          await send(message, smtpServer);
        }
        catch (_)
        {
          return false;
        }

      return true;
    },
    sendPasswordResetEmail: (session, UserInfo, validationCode) async
    {
      final gmailEmail = session.serverpod.getPassword("gmailEmail");
      final gmailPassword = session.serverpod.getPassword("gmailPassword");
      //print("Password reset code: $validationCode");
      if (gmailEmail == null || gmailPassword == null) {
        throw Exception('Gmail credentials are not set.');
      }
      final smtpServer = gmail(gmailEmail, gmailPassword);

      final message = Message()
        ..from = Address(gmailEmail)
        ..recipients.add(UserInfo.email)
        ..subject = "Password Reset link"
        ..html = "Here is your password reset code: $validationCode";

        try{
          await send(message, smtpServer);
        }
        catch (_)
        {
          return false;
        }

      return true;
    }
  ));

  // Start the server.
  await pod.start();

  // After starting the server, you can register future calls. Future calls are
  // tasks that need to happen in the future, or independently of the request/response
  // cycle. For example, you can use future calls to send emails, or to schedule
  // tasks to be executed at a later time. Future calls are executed in the
  // background. Their schedule is persisted to the database, so you will not
  // lose them if the server is restarted.


}

