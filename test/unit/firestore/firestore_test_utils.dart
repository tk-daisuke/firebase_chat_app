import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class UserTestUtils {
  Future<void> updateUser(
      UserRepository userRepo, MockUser authUser, FireUser fireUser) async {
    // authUserの情報をFirestore
    await userRepo.userDirectryUpdater(authUser);
    final snapshot = await userRepo.userProfileQuery(authUser.uid).get();
    // 取得は1件のみか
    expect(snapshot.docs.length, 1);
    final user = snapshot.docs[0].data();
    // UserがFireUserに変換されているか
    expect(user, fireUser);
    //変換内容は想定通りか
    expect(user.name, authUser.displayName);
    expect(user.iconURL, authUser.photoURL);
    expect(user.uid, authUser.uid);
  }
}
