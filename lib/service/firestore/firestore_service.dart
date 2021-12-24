import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FirebaseFirestoreBase {
  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;
  final serverTimeStamp = FieldValue.serverTimestamp();
  Future<void> signUp(User user);
}

class FirestoreService extends FirebaseFirestoreBase {
  FirestoreService(this._read);

  final Reader _read;
  
  DocumentReference get _usersQuery {
    final _auth = FirebaseAuthService(_read);
    return _firestore.collection('users').doc(_auth.firebaseUID);
  }

  @override
  Future<void> signUp(User user) async {
    final _path = _usersQuery;

    final _hasData = await _path.get();
    //なかったら作る
    if (!_hasData.exists) {
      final providerData = user.providerData.isEmpty
          ? 'anonymous'
          : user.providerData[0].providerId;
      await _path.set({
        'name': user.displayName ?? '',
        'uid': user.uid,
        'provider': providerData,
        'createdAt': serverTimeStamp,
      });
    }
  }
}
