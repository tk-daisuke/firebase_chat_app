import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/model/room/room.dart';
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

  Query<FireUser> fetchProfile(String uid) => _firestore
      .collection('users')
      .where('uid', isEqualTo: uid)
      .limit(1)
      .withConverter<FireUser>(
        fromFirestore: (snapshot, _) => FireUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) =>
            FireUser(uid: user.uid, iconURL: user.iconURL, name: user.name)
                .toJson(),
      );

  Query<Room> fetchJoindRoom(String uid) => _firestore
      .collection('rooms')
      .where('entrant', arrayContains: uid)
      .withConverter<Room>(
        fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
        toFirestore: (room, _) => room.copyWith().toJson(),
      );

  // Query<Map<String, dynamic>> _fetchFirendRoom(
  //         {required String myUID, required String firendUID}) =>
  //     _firestore.collection('rooms').where('entrant',
  //         whereIn: [myUID]);

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
      final doc = snapshot.data();
      final bool isUserNameChange = doc?['name'] != user.displayName;
      final bool isPhotoURLChange = doc?['name'] != user.photoURL;
      if (isUserNameChange || isPhotoURLChange) {
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

  Future<bool> addFriend(
      {required String friendUID, required String myUID}) async {
    final _path = _firestore.collection('rooms').doc();

    final _joindRoom = await fetchJoindRoom(myUID).get();
    final _rooms = _joindRoom.docs.map((e) => e.data()).toList();
    final _friendCheck = _isFriendIncluded(_rooms, friendUID);

    // なかったら作る
    if (_friendCheck) {
      final room = Room(
        name: 'name',
        entrant: [myUID, friendUID],
      ).toJson()
        ..['createdAT'] = serverTimeStamp;

      await _path.set(room);
      //フレンド登録完了
      return true;
    } else {
      //フレンド登録済み
      return false;
    }
  }

  bool _isFriendIncluded(List<Room> _joindRoom, String friendUID) {
    final _uidList = _joindRoom.map((room) {
      final where = room.entrant.where((uid) => uid != friendUID);
      return where.toList();
    }).toList();

    return _uidList.isEmpty;
  }
}
