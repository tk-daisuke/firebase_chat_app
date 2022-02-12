import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'firestore_test_utils.dart';

void main() {
  final repository = UserRepository(firestore: FakeFirebaseFirestore());
  final utils = UserTestUtils();
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
  group('User情報登録、User情報更新', () {
    test('Add User', () async {
      await utils.updateUser(repository, authUser, fireUser);
    });
    test('Update User', () async {
      // 新規ユーザー追加
      await utils.updateUser(repository, authUser, fireUser);
      // update
      await utils.updateUser(repository, authUserUpdated, fireUserUpdated);
    });
  });
}
