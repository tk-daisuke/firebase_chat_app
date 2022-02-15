import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/base/firestore_base.dart';

class UserRepository extends FirebaseFirestoreBase {
  final FirebaseFirestore _firestore;
  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Query<FireUser> userProfileQuery(String uid) => _firestore
      .collection('users')
      .where('uid', isEqualTo: uid)
      .limit(1)
      .withConverter<FireUser>(
        fromFirestore: (snapshot, _) => FireUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  Future<void> userDirectryUpdater(User user) async {
    final _path = _firestore.collection('users').doc(user.uid);
    final snapshot = await _path.get();

    //なかった時
    if (!snapshot.exists) {
      await _addUser(user, _path);
      //あった時
    } else {
      await _updateUser(snapshot, user, _path);
    }
  }

  Future<void> _addUser(User user, DocumentReference _path) async {
    final fireUser =
        FireUser(uid: user.uid, iconURL: user.photoURL, name: user.displayName!)
            .toJson()
          ..['createdAt'] = serverTimeStamp;
    await _path.set(fireUser);
  }

  Future<void> _updateUser(DocumentSnapshot<Map<String, dynamic>> snapshot,
      User user, DocumentReference _path) async {
    final docUser = FireUser.fromJson(snapshot.data()!);

    final bool isUserNameChange = docUser.name != user.displayName;
    final bool isPhotoURLChange = docUser.iconURL != user.photoURL;
    // final bool isProviderChange = doc?['provider'] != user.providerData;

    if (isUserNameChange || isPhotoURLChange) {
      final updateUser = docUser
          .copyWith(iconURL: user.photoURL, name: user.displayName!)
          .toJson()
        ..['updatedAt'] = serverTimeStamp;
      await _path.update(
        updateUser,
      );
    }
  }
}
