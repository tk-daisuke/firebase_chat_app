import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/view/ui/flutter_fire/signin/fire_siginin_screen.dart';
import 'package:firebase_template_app/view/ui/navigator/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rootProvider = ChangeNotifierProvider((ref) => RootModel(ref.read));

class RootModel extends ChangeNotifier {
  // ignore: unused_field
  final Reader _read;
  RootModel(this._read);

  Future<void> loginCheck(
    BuildContext context,
  ) async {
    final _user = _read(firebaseAuthProvider);

    //ログイン中
    if (_user != null) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacementNamed(context, NavigatorScreen.id),
      );
      //ログアウト中
    } else {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacementNamed(context, FireSignInScreen.id),
      );
    }
  }
}
