import 'dart:math';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'firestore_test_utils.dart';

final repository = UserRepository(firestore: FakeFirebaseFirestore());
const uid = 'uidwafu-';
// 新規ユーザー
final authUser = MockUser(
  displayName: 'tester',
  photoURL: 'google.com',
  uid: uid,
  email: 'gafam@ceo.com',
);
final fireUser =
    FireUser(uid: uid, iconURL: authUser.photoURL, name: authUser.displayName!);
// ユーザー情報変更
final authUserUpdated = MockUser(
  displayName: 'updateName',
  photoURL: 'updateURL',
  uid: uid,
  email: 'gafam@cso.mm',
);
final fireUserUpdated = FireUser(
    uid: uid,
    iconURL: authUserUpdated.photoURL,
    name: authUserUpdated.displayName!);

void main() {
  final utils = UserTestUtils();

  final currentYear = DateTime.now().year;
  final currentMonth = DateTime.now().month;
  final currentDay = DateTime.now().day;

  setUp((() async {
    // 複数のユーザーがいることを想定
    for (var i = 0; i < 10; i++) {
      final dummyUser = MockUser(
        displayName: Random().nextDouble().toString(),
        photoURL: Random().nextDouble().toString(),
        uid: Random().nextDouble().toString(),
        email: Random().nextDouble().toString(),
      );
      await utils.updateUser(repository, dummyUser);
    }
  }));
  test('取得は0件か', () async {
    final snapshot = await repository.userProfileQuery(authUser.uid).get();

    expect(snapshot.docs.length, 0);
  });
  test('取得は1件のみか', () async {
    final snapshot = await utils.updateUser(repository, authUser);
    expect(snapshot.docs.length, 1);
  });
  test('UserがFireUserに変換されているか 変換内容は正しいか', () async {
    final snapshot = await utils.updateUser(repository, authUser);
    final user = snapshot.docs[0].data();

    expect(user.name, fireUser.name);
    expect(user.iconURL, fireUser.iconURL);
    expect(user.uid, fireUser.uid);
    expect(user.createdAt?.year, currentYear);
    expect(user.createdAt?.month, currentMonth);
    expect(user.createdAt?.day, currentDay);
    expect(user.updatedAt, null);
  });

  test('上書き', () async {
    final snapshot = await utils.updateUser(repository, authUser);
    final user = snapshot.docs[0].data();
    expect(user.name, authUser.displayName);
    expect(user.iconURL, authUser.photoURL);
    expect(user.uid, authUser.uid);
    expect(user.createdAt?.year, currentYear);
    expect(user.createdAt?.month, currentMonth);
    expect(user.createdAt?.day, currentDay);
    expect(user.updatedAt, null);
    final snapshotUpdate = await utils.updateUser(repository, authUserUpdated);
    final userUpdated = snapshotUpdate.docs[0].data();
    expect(userUpdated.name, authUserUpdated.displayName);
    expect(userUpdated.iconURL, authUserUpdated.photoURL);
    expect(userUpdated.uid, authUserUpdated.uid);
    expect(userUpdated.createdAt, user.createdAt);
    expect(userUpdated.updatedAt?.year, currentYear);
    expect(userUpdated.updatedAt?.month, currentMonth);
    expect(userUpdated.updatedAt?.day, currentDay);
  });
}
