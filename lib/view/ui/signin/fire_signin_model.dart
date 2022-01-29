import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/service/firestore/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fireSigninProvider =
    ChangeNotifierProvider((ref) => FireSigninModel(ref.read));

class FireSigninModel extends ChangeNotifier {
  FireSigninModel(this._read);
  final Reader _read;
  Future<void> signup(User user) async {
    await FirestoreService(_read).userDirectryUpdater(user);
  }
}
