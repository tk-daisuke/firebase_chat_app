import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = StateNotifierProvider<FirebaseAuthService, User?>(
  (ref) => FirebaseAuthService(ref.read),
);

class FirebaseAuthService extends StateNotifier<User?> {
  // ignore: unused_field
  final Reader _read;

  FirebaseAuthService(this._read) : super(FirebaseAuth.instance.currentUser) {
    _auth.userChanges().listen((user) {
      if (kDebugMode) {
        print(user);
      }
      state = user;
    });
  }
  final _auth = FirebaseAuth.instance;

  String? get firebaseUID => state!.uid;
  Future<UserCredential> signUpAnonymously() => _auth.signInAnonymously();
  deleteUser() => state!.delete();
}

// abstract class FirebaseAuthBase {
//   Stream<User> get userChanges;
//   String? get firebaseUID;
//   UserCredential signUpAnonymously();
//   deleteUser();
// }

// final firebaseAuthServiceProvider =
//     Provider<FirebaseAuthService>((ref) => FirebaseAuthService(ref.read));

// class FirebaseAuthService implements FirebaseAuthBase  {
//   // ignore: unused_field
//   final Reader _read;
//   FirebaseAuthService(this._read);

//   final _auth = FirebaseAuth.instance;

//   @override
//   deleteUser() {
//     // TODO: implement deleteUser
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement firebaseUID
//   String? get firebaseUID => throw UnimplementedError();

//   @override
//   UserCredential signUpAnonymously() {
//     // TODO: implement signUpAnonymously
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement userChanges
//   Stream<User> get userChanges => throw UnimplementedError();
// }
