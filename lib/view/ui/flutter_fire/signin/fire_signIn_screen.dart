import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/service/auth/google_key_helper.dart';
import 'package:firebase_template_app/view/ui/flutter_fire/signin/fire_signin_model.dart';
import 'package:firebase_template_app/view/ui/navigator/navigator_screen.dart';
import 'package:firebase_template_app/view/utils/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

class FireSignInScreen extends ConsumerWidget {
  const FireSignInScreen({
      Key? key,
    required FirebaseAuth auth,
    required this.forgotPasswordScreenId,
  })  : _auth = auth,
        super(key: key);
  static const String id = 'FlutterFireSignInScreen';
  final FirebaseAuth _auth;
  final String forgotPasswordScreenId;

  @override
  Widget build(BuildContext context, ref) {
    final _appid = GoogleKeyHelper().getAppID();
    final _model = ref.read(fireSigninProvider);
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
        AuthStateChangeAction<SignedIn>((context, state) async {
          await _model.signup(state.user!);
          Navigator.pushReplacementNamed(context, NavigatorScreen.id);
        }),
      ],
      headerBuilder: (context, constraints, _) {
        return const HeaderImage(
            'https://firebase.flutter.dev/img/flutterfire_300x.png');
      },
      providerConfigs: [
        const EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: _appid),
      ],
    );
  }
}
