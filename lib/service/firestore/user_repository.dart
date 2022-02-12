import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/base/firestore_base.dart';

class UserRepository extends FirebaseFirestoreBase {
  Query<FireUser> userProfileQuery(String uid) => firestore
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
    final _path = firestore.collection('users').doc(user.uid);

    final providerData = user.providerData.isEmpty
        ? 'anonymous'
        : user.providerData[0].providerId;
    final snapshot = await _path.get();
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
      final bool isPhotoURLChange = doc?['iconURL'] != user.photoURL;
      final bool isProviderChange = doc?['provider'] != user.providerData;

      if (isUserNameChange || isPhotoURLChange || isProviderChange) {
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
}
