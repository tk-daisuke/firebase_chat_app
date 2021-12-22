import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:firebase_template_app/view/ui/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class FlutterFireProfileScreen extends StatelessWidget {
  const FlutterFireProfileScreen({
    Key? key,
    required FirebaseAuth auth,
  })  : _auth = auth,
        super(key: key);

  final FirebaseAuth _auth;
  static const String id = 'FlutterfireProfileScreen';

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      auth: _auth,
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, RootScreen.id);
        }),
      ],
    );
  }
}

class FlutterFireForgotPasswordScreen extends StatelessWidget {
  const FlutterFireForgotPasswordScreen({
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

class FlutterFireSignInScreen extends StatelessWidget {
  const FlutterFireSignInScreen({
    Key? key,
    required FirebaseAuth auth,
    required this.forgotPasswordScreenId,
  })  : _auth = auth,
        super(key: key);
  static const String id = 'FlutterFireSignInScreen';
  final FirebaseAuth _auth;
  final String forgotPasswordScreenId;

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      auth: _auth,
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            forgotPasswordScreenId,
            arguments: {'email': email},
          );
        }),
        // VerifyPhoneAction((context, _) {
        //   Navigator.pushNamed(context, '/phone');
        // }),
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        }),
        // EmailLinkSignInAction((context) {
        //   Navigator.pushReplacementNamed(context, '/email-link-sign-in');
        // }),
      ],
      headerBuilder: (context, constraints, _) {
        return headerImage(
            'https://firebase.flutter.dev/img/flutterfire_300x.png');
      },
      providerConfigs: const [],
    );
  }
}

Padding headerImage(String image) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: AspectRatio(
      aspectRatio: 1,
      child: Image.network(image),
    ),
  );
}
