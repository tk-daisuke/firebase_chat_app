
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:firebase_template_app/view/ui/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class FlutterFireUIList {
  final _auth = FirebaseAuth.instance;

  SignInScreen signIn() {
    return SignInScreen(
      auth: _auth,
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            '/forgot-password',
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

  ForgotPasswordScreen forgotPasswordScreen(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return ForgotPasswordScreen(
      email: arguments?['email'],
      headerMaxExtent: 200,
      // headerBuilder: headerIcon(Icons.lock),
    );
  }

  ProfileScreen profileScreen() {
    // final String appid;
    // if (Platform.isAndroid) {
    //   appid = kFirebaseAndroidAppID;
    // } else if (Platform.isIOS) {
    //   appid = kFirebaseIosAppID;
    // }

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

Padding headerImage(String image) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: AspectRatio(
      aspectRatio: 1,
      child: Image.network(image),
    ),
  );
}
