import 'package:firebase_template_app/service/auth/google_key_helper.dart';
import 'package:firebase_template_app/view/ui/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class FireProfileScreen extends StatelessWidget {
  const FireProfileScreen({
    Key? key,
  }) : super(key: key);

  static const String id = 'FlutterfireProfileScreen';

  @override
  Widget build(BuildContext context) {
    final _appid = GoogleKeyHelper().getAppID();

    return ProfileScreen(
      providerConfigs: [
        const EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: _appid)
      ],
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, RootScreen.id);
        }),
      ],
    );
  }
}
