import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_template_app/service/firestore/room_repository.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/room_test_utils.dart';
import 'utils/user_test_utils.dart';

void main() {
  final fakeFirestore = FakeFirebaseFirestore();
  final roomRepository = RoomRepository(firestore: fakeFirestore);
  final roomTestUtils = RoomTestUtils(roomRepository);
  final userRepository = UserRepository(firestore: fakeFirestore);
  final userTestUtils = UserTestUtils(userRepository);

  setUp(() async {
    fakeFirestore.dump();
    // 他人を作成
    await userTestUtils.dummyUserGenerate();
    // 他人のルームを作成
    await roomTestUtils.dummyRoomGenerate();
  });
  group('フレンド登録 1件', () {
    final me = userTestUtils.createUser('me1');
    final friend = userTestUtils.createUser('frined1');
    test('フレンド登録', () async {
      // フレンド登録が完了していない
      final firstSnapshot = await roomRepository.joindRoomQuery(me.uid).get();
      expect(firstSnapshot.docs.length, 0);
      // フレンド登録をするとルームが作成される
      await roomRepository.addFriend(friendUID: me.uid, myUID: friend.uid);
      final snapshot = await roomRepository.joindRoomQuery(me.uid).get();
      expect(snapshot.docs.length, 1);
    });
    test('フレンド登録済みユーザーとフレンド登録', () async {
      // フレンド登録済みなのでRoomが作成されない
      await roomRepository.addFriend(friendUID: me.uid, myUID: friend.uid);
      await roomRepository.addFriend(friendUID: me.uid, myUID: friend.uid);
      await roomRepository.addFriend(friendUID: me.uid, myUID: friend.uid);
      await roomRepository.addFriend(friendUID: me.uid, myUID: friend.uid);
      final snapshot = await roomRepository.joindRoomQuery(me.uid).get();
      expect(snapshot.docs.length, 1);
    });
  });
  group('フレンド登録 10件', () {
    final me = userTestUtils.createUser('me10');
    // final friend = userTestUtils.createUser('frined10');
    test('10件', () async {
      // フレンド登録が完了していない
      final firstSnapshot = await roomRepository.joindRoomQuery(me.uid).get();
      expect(firstSnapshot.docs.length, 0);
      //Frind10人追加
      await roomTestUtils.joindRoomGenerate(me.uid, 10);

      final snapshot = await roomRepository.joindRoomQuery(me.uid).get();
      expect(snapshot.docs.length, 10);
    });
    test('フレンド登録済みユーザーとフレンド登録', () async {
      // フレンド登録済みなのでRoomが作成されない
      await roomTestUtils.joindRoomGenerate(me.uid, 10);
      await roomTestUtils.joindRoomGenerate(me.uid, 10);
      final snapshot = await roomRepository.joindRoomQuery(me.uid).get();
      expect(snapshot.docs.length, 10);
    });
  });
}
