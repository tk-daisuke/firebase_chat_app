import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  final repository = UserRepository(firestore: instance);

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

  group('user_repository', () {
    test('add User', () async {
      await _addNewUser(repository, authUser, fireUser);
    });
    test('Update User', () async {
      // 新規ユーザー追加
      await _addNewUser(repository, authUser, fireUser);
      // update
      await repository.userDirectryUpdater(authUserUpdated);
      // 取得
      final snapshotUpdated =
          await repository.userProfileQuery(authUserUpdated.uid).get();
      // snapshot の長さを確認
      expect(snapshotUpdated.docs.length, 1);
      // snapshotの中身を確認
      final updatedUser = snapshotUpdated.docs[0].data();
      expect(updatedUser, fireUserUpdated);
    });
  });
}

Future<void> _addNewUser(
    UserRepository repository, MockUser authUser, FireUser fireUser) async {
  await repository.userDirectryUpdater(authUser);
  final snapshot = await repository.userProfileQuery(authUser.uid).get();
  expect(snapshot.docs.length, 1);
  final user = snapshot.docs[0].data();
  expect(user, fireUser);
}
