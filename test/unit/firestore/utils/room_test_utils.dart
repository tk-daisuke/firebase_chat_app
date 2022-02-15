import 'dart:math';

import 'package:firebase_template_app/service/firestore/room_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class RoomTestUtils {
  final RoomRepository repository;

  RoomTestUtils(this.repository);

  Future<void> dummyRoomGenerate() async {
    for (var i = 0; i < 10; i++) {
      // final dummyRoom = Room(name: Random().nextDouble().toString(), entrant: [
      //   Random().nextDouble().toString(),
      //   Random().nextDouble().toString()
      // ]);

      await repository.addFriend(
          friendUID: Random().nextDouble().toString(),
          myUID: Random().nextDouble().toString());
    }
  }

  Future<void> joindRoomGenerate(String uid, int roomLength) async {
    for (var i = 0; i < roomLength; i++) {
      final friendUID = uid + i.toString();
      await repository.addFriend(friendUID: friendUID, myUID: uid);
    }
  }
}
