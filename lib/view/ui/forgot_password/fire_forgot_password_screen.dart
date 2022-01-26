import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class FireForgotPasswordScreen extends StatelessWidget {
  const FireForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  static const String id = 'FlutterFireForgotPasswordScreen';
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return ForgotPasswordScreen(
      email: arguments?['email'],
      headerMaxExtent: 200,
      // headerBuilder: headerIcon(Icons.lock),
    );
  }
}
