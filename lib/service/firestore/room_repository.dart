import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/message/message.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/service/firestore/base/firestore_base.dart';

class RoomRepository extends FirebaseFirestoreBase {
  final FirebaseFirestore _firestore;
  RoomRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Query<Room> joindRoomQuery(String uid) => _firestore
      .collection('rooms')
      .where('entrant', arrayContains: uid)
      .withConverter<Room>(
        fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
        toFirestore: (room, _) => room.toJson(),
      );

  CollectionReference<Message> currentRoomMessages(String id) {
    return _firestore
        .collection('rooms')
        .doc(id)
        .collection('messages')
        .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson(),
        );
  }

  // Query<Map<String, dynamic>> _fetchFirendRoom(
  //         {required String myUID, required String firendUID}) =>
  //     _firestore.collection('rooms').where('entrant',
  //         whereIn: [myUID]);
  Future<void> sendMessage(
      {required String roomID,
      required String myUID,
      required String text}) async {
    final message = Message(
      text: text,
      postUserID: myUID,
    ).toJson()
      ..['createdAT'] = serverTimeStamp;
    final _path =
        _firestore.collection('rooms').doc(roomID).collection('messages');
    await _path.add(message);
  }

  Future<bool> addFriend(
      {required String friendUID, required String myUID}) async {
    // 自分が入ってるRoomを取得
    final _joindRoom = await joindRoomQuery(myUID).get();
    // List<Room>に変換
    final _rooms = _joindRoom.docs.map((e) => e.data()).toList();
    //  List<Room>にfriendがいるか確認
    final _friendCheck = _isFriendIncluded(_rooms, friendUID);

    // なかったら作る
    if (_friendCheck) {
      final room = Room(
        name: 'name',
        entrant: [myUID, friendUID],
      ).toJson()
        ..['createdAT'] = serverTimeStamp;
      final _path = _firestore.collection('rooms');
      await _path.add(room);
      //フレンド登録完了
      return true;
    } else {
      //フレンド登録済み
      return false;
    }
  }

  bool _isFriendIncluded(List<Room> _joindRoom, String friendUID) {
    final _uidList = _joindRoom.where((uid) {
      return uid.entrant.where((element) => element == friendUID).isNotEmpty;
    });
    return _uidList.isEmpty;
  }
}
