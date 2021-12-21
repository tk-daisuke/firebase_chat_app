import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    final emailContoroller = TextEditingController();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EmailInput(
                initialValue: 'a',
                controller: emailContoroller,
                onSubmitted: (String value) {},
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Expanded(
                            child: EmailSignUpDialog(
                              auth: FirebaseAuth.instance,
                              action: AuthAction.signUp,
                              config: const EmailProviderConfiguration(),
                            ),
                          );
                        });
                  },
                  child: const Text(''))
            ],
          ),
        ),
      ),
    );
  }
}
