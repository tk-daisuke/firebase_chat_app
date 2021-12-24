import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/data/localize/flutter_fire/flutter_fire_ui_ja.dart';
import 'package:firebase_template_app/view/ui/flutter_fire/fire_forgot_password_screen.dart';
import 'package:firebase_template_app/view/ui/flutter_fire/fire_profile_screen.dart';
import 'package:firebase_template_app/view/ui/flutter_fire/signin/fire_signIn_screen.dart';
import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:firebase_template_app/view/ui/navigator/navigator_screen.dart';
import 'package:firebase_template_app/view/ui/root/root_screen.dart';
import 'package:firebase_template_app/view/ui/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/i10n.dart';

// arch -x86_64 pod install
// arch -x86_64 pod repo update
// arch -x86_64 pod install --repo-update
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
        FlutterFireUIJA()
      ],
      supportedLocales: const [
        Locale('ja', ''), // 日本語
      ],
      initialRoute: RootScreen.id,
      routes: {
        RootScreen.id: (context) => const RootScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        FireSignInScreen.id: (context) => FireSignInScreen(
              auth: _auth,
              forgotPasswordScreenId: FireForgotPasswordScreen.id,
            ),
        FireProfileScreen.id: (context) => const FireProfileScreen(),
        FireForgotPasswordScreen.id: (context) =>
            const FireForgotPasswordScreen(),
        NavigatorScreen.id: (context) => const NavigatorScreen()
      },
    );
  }
}
