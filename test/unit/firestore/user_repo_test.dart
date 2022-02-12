import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'firestore_test_utils.dart';

void main() {
  final repository = UserRepository(firestore: FakeFirebaseFirestore());
// 新規ユーザー
  final authUser = MockUser(
    displayName: 'tester',
    photoURL: 'google.com',
    uid: 'uidwafu-',
    email: 'gafam@ceo.com',
  );
  final fireUser = FireUser(
      uid: authUser.uid,
      iconURL: authUser.photoURL,
      name: authUser.displayName!);
// ユーザー情報変更
  final authUserUpdated = MockUser(
    displayName: 'updateName',
    photoURL: 'updateURL',
    uid: 'uidwafu-',
    email: 'gafam@cso.mm',
  );
  final fireUserUpdated = FireUser(
      uid: authUserUpdated.uid,
      iconURL: authUserUpdated.photoURL,
      name: authUserUpdated.displayName!);
  // group('user query', () {
  //   test('型確認', () async {
  //     final query = repository
  //         .userProfileQuery(authUser.uid);
  //     // print(query.parameters);
  //     expect(query,FakeConvertedQuery<FireUser>);
  //   });
  // });

  group('変換確認', () {
    final utils = UserTestUtils();
    test('取得は0件か', () async {
      final snapshot = await repository.userProfileQuery(authUser.uid).get();

      expect(snapshot.docs.length, 0);
    });
    test('取得は1件のみか', () async {
      final snapshot = await utils.updateUser(repository, authUser);
      expect(snapshot.docs.length, 1);
    });
    test('UserがFireUserに変換されているか', () async {
      final snapshot = await utils.updateUser(repository, authUser);
      final user = snapshot.docs[0].data();
      expect(user, fireUser);
    });
    test('変換内容は正しいか', () async {
      final snapshot = await utils.updateUser(repository, authUser);
      final user = snapshot.docs[0].data();
      expect(user.name, authUser.displayName);
      expect(user.iconURL, authUser.photoURL);
      expect(user.uid, authUser.uid);
    });

    test('上書き', () async {
      final snapshot = await utils.updateUser(repository, authUser);
      final user = snapshot.docs[0].data();
      expect(user, fireUser);
      expect(user.name, authUser.displayName);
      expect(user.iconURL, authUser.photoURL);
      expect(user.uid, authUser.uid);

      final snapshotUpdate =
          await utils.updateUser(repository, authUserUpdated);
      final userUpdated = snapshotUpdate.docs[0].data();
      expect(userUpdated, fireUserUpdated);
      expect(userUpdated.name, authUserUpdated.displayName);
      expect(userUpdated.iconURL, authUserUpdated.photoURL);
      expect(userUpdated.uid, authUserUpdated.uid);
    });
  });
}
