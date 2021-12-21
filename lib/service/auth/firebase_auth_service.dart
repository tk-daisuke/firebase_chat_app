import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider =
    StateNotifierProvider<FirebaseAuthService, User?>(
  (ref) => FirebaseAuthService(ref.read),
);

class FirebaseAuthService extends StateNotifier<User?> {
  // ignore: unused_field
  final Reader _read;

  FirebaseAuthService(this._read) : super(null) {
    _auth.userChanges().listen((user) {
      state = user;
    });
  }
  final _auth = FirebaseAuth.instance;
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
