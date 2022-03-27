import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/user_test_utils.dart';

void main() {
  final repository = UserRepository(firestore: FakeFirebaseFirestore());
  final utils = UserTestUtils(repository);

  final now = DateTime.now();
  final currentYear = now.year;
  final currentMonth = now.month;
  final currentDay = now.day;

  setUp((() async {
    // 複数のユーザーがいることを想定
    await utils.dummyUserGenerate();
  }));

  group('取得', () {
    final _user = utils.createUser('getUser');
    test('取得は0件', () async {
      // 未登録で取得
      final snapshot = await repository.userProfileQuery(_user.uid).get();
      expect(snapshot.docs.length, 0);
    });
    test('取得は1件', () async {
      // 登録して取得
      await utils.updateUser(_user);
      await utils.updateUser(_user);
      await utils.updateUser(_user);
      final snapshot = await utils.updateUser(_user);
      expect(snapshot.docs.length, 1);
    });
  });
  test('UserがFireUserに変換されているか 変換内容は正しいか', () async {
    final _user = utils.createUser('convertUser');

    // 登録して取得
    final snapshot = await utils.updateUser(_user);
    final user = snapshot.docs[0].data();

    expect(user.name, _user.displayName);
    expect(user.iconURL, _user.photoURL);
    expect(user.uid, _user.uid);
    expect(user.createdAt?.year, currentYear);
    expect(user.createdAt?.month, currentMonth);
    expect(user.createdAt?.day, currentDay);
    expect(user.updatedAt, null);
  });

  test('上書き', () async {
    const uid = 'uidwafu-';
// 新規ユーザー
    final authUser = MockUser(
      displayName: 'tester',
      photoURL: 'google.com',
      uid: uid,
      email: 'gafam@ceo.com',
    );
    // final fireUser = FireUser(
    //     uid: uid, iconURL: authUser.photoURL, name: authUser.displayName!);
// ユーザー情報変更
    final authUserUpdated = MockUser(
      displayName: 'updateName',
      photoURL: 'updateURL',
      uid: uid,
      email: 'gafam@cso.mm',
    );

    final snapshot = await utils.updateUser(authUser);
    final user = snapshot.docs[0].data();
    expect(user.name, authUser.displayName);
    expect(user.iconURL, authUser.photoURL);
    expect(user.uid, authUser.uid);
    expect(user.createdAt?.year, currentYear);
    expect(user.createdAt?.month, currentMonth);
    expect(user.createdAt?.day, currentDay);
    expect(user.updatedAt, null);
    final snapshotUpdate = await utils.updateUser(authUserUpdated);
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
