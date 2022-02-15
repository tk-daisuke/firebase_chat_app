import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class UserTestUtils {
  final UserRepository repository;

  UserTestUtils(this.repository);

  Future<QuerySnapshot<FireUser>> updateUser(MockUser authUser) async {
    // authUserの情報をFirestore
    await repository.userDirectryUpdater(authUser);
    final snapshot = await repository.userProfileQuery(authUser.uid).get();

    return snapshot;
  }

  Future<void> dummyUserGenerate() async {
    for (var i = 0; i < 10; i++) {
      final dummyUser = MockUser(
        displayName: Random().nextDouble().toString(),
        photoURL: Random().nextDouble().toString(),
        uid: Random().nextDouble().toString(),
        email: Random().nextDouble().toString(),
      );
      await updateUser(dummyUser);
    }
  }

  MockUser createUser(String uid) => MockUser(
        displayName: '$uid\tester',
        photoURL: '$uid\tester.test',
        uid: uid,
        email: '$uid\tester@cso.mm',
      );
}
