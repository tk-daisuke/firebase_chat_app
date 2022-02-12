import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fireSigninProvider = ChangeNotifierProvider((ref) => FireSigninModel());

class FireSigninModel extends ChangeNotifier {
  FireSigninModel();
  // final Reader _read;
  Future<void> signup(User user) async {
    await UserRepository().userDirectryUpdater(user);
  }
}
