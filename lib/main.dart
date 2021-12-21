import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:firebase_template_app/view/ui/root/root_screen.dart';
import 'package:firebase_template_app/view/ui/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RootScreen.id,
        routes: {
          RootScreen.id: (context) => const RootScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          'SignInScreen': (context) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction((context, email) {
                  Navigator.pushNamed(
                    context,
                    '/forgot-password',
                    arguments: {'email': email},
                  );
                }),
                VerifyPhoneAction((context, _) {
                  Navigator.pushNamed(context, '/phone');
                }),
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/profile');
                }),
                EmailLinkSignInAction((context) {
                  Navigator.pushReplacementNamed(
                      context, '/email-link-sign-in');
                }),
              ],
              headerBuilder: (context, constraints, _) {
                return headerImage(
                    'https://firebase.flutter.dev/img/flutterfire_300x.png');
              },
              providerConfigs: [],
            );
          }
        });
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
}
