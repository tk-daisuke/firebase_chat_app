import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:firebase_template_app/view/ui/profile/fire_profile_screen.dart';
import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomIndex = StateProvider<int>((ref) => 0);
final navigatorProvider =
    ChangeNotifierProvider((ref) => NavigatorModel());

class NavigatorModel extends ChangeNotifier {
  NavigatorModel();
  // final Reader _read;

  void userNameInspecter(WidgetRef ref, BuildContext context) {
    final _userRepo = UserRepository();
    ref.listen<User?>(
      firebaseAuthProvider,
      (oldValue, newValue) {
        if (oldValue?.displayName == newValue?.displayName) {
          return;
        } else {
          newValue != null ? _userRepo.userDirectryUpdater(newValue) : null;
        }
      },
      onError: (error, stackTrace) => debugPrint('$error'),
    );
  }

  final pageWidgets = [
    const HomeScreen(),
    const FireProfileScreen(),
  ];
}
