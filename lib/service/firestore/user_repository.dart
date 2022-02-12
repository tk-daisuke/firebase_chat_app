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
        toFirestore: (user, _) =>
            FireUser(uid: user.uid, iconURL: user.iconURL, name: user.name)
                .toJson(),
      );
  Future<void> userDirectryUpdater(User user) async {
    final _path = _firestore.collection('users').doc(user.uid);

    final snapshot = await _path.get();
    final fireUser =
        FireUser(uid: user.uid, iconURL: user.photoURL, name: user.displayName!)
            .toJson();
    //なかった時
    if (!snapshot.exists) {
      await _path.set(fireUser..['createdAt'] = serverTimeStamp);
      //あった時
    } else {
      final doc = snapshot.data();
      final bool isUserNameChange = doc?['name'] != user.displayName;
      final bool isPhotoURLChange = doc?['iconURL'] != user.photoURL;
      final bool isProviderChange = doc?['provider'] != user.providerData;

      if (isUserNameChange || isPhotoURLChange || isProviderChange) {
        final fireUser = FireUser(
                uid: user.uid, iconURL: user.photoURL, name: user.displayName!)
            .toJson();
        await _path.update(
          fireUser..['updatedAt'] = serverTimeStamp,
        );
      }
    }
  }
}
