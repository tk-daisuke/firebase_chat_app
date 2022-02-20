import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/model/message/message.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  final room = Room(
    createdAt: DateTime(1999, 6, 6),
    updatedAt: DateTime(2001, 7, 7),
    entrant: ['user1', 'user2'],
    name: 'room',
  );

  final json = <String, Object>{
    'name': 'room',
    'entrant': ['user1', 'user2'],
    'createdAt': Timestamp(928594800, 0),
    'updatedAt': Timestamp(994431600, 0),
  };
  test('toJSON', () {
    final toJson = room.toJson();
    expect(toJson, json);
  });

  test('fromJSON', () {
    final fromJson = Room.fromJson(json);
    expect(fromJson, room);
  });
}
