import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FirebaseFirestoreBase {
  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;
  final serverTimeStamp = FieldValue.serverTimestamp();
  Future<void> signUp(User user);
}

class FirestoreService extends FirebaseFirestoreBase {
  FirestoreService(this._read);

  // ignore: unused_field
  final Reader _read;

  Query<Map<String, dynamic>> fetchProfile(String uid) =>
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .limit(1);

  Query<Map<String, dynamic>> fetchRoom() =>
      FirebaseFirestore.instance.collection('rooms').where('entrant');

  Future<void> userDirectryUpdate(User? user) async {
    if (user != null) {
      final _path = _firestore.collection('users').doc(user.uid);

      final _userDoc = await _path.get();
      await _userDocProvider(_userDoc, user, _path);
    } else {
      if (kDebugMode) {
        print('user null');
      }
    }
  }

  Future<void> _userDocProvider(DocumentSnapshot<Map<String, dynamic>> snapshot,
      User user, DocumentReference<Map<String, dynamic>> _path) async {
    final providerData = user.providerData.isEmpty
        ? 'anonymous'
        : user.providerData[0].providerId;

    //なかった時
    if (!snapshot.exists) {
      await _path.set({
        'name': user.displayName ?? '',
        'uid': user.uid,
        'iconURL': user.photoURL ?? '',
        'provider': providerData,
        'createdAt': serverTimeStamp,
      });
      //あった時
    } else {
      final String doc = snapshot.data()?['name'];
      final bool isUpdate = doc != user.displayName;
      if (isUpdate) {
        await _path.update({
          'name': user.displayName ?? '',
          // 'uid': user.uid,
          'iconURL': user.photoURL ?? '',
          'provider': providerData,
          'updatedAt': serverTimeStamp,
        });
      }
    }
  }

  @override
  Future<void> signUp(User? user) async {
    final _path = _firestore.collection('users').doc(user?.uid);

    final _hasData = await _path.get();
    //なかったら作る
    if (!_hasData.exists) {
      await userDirectryUpdate(user);
    }
  }
}
