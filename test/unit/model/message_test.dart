import 'package:firebase_template_app/model/message/message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  final message = Message(
    text: 'text',
    postUserID: 'postUserID',
    createdAt: DateTime(1999, 1, 4),
    updatedAt: DateTime(2001, 4, 1),
  );

  final json = <String, Object>{
    'text': 'text',
    'postUserID': 'postUserID',
    'createdAt': Timestamp(915375600, 0),
    'updatedAt': Timestamp(986050800, 0),
  };
  test('toJSON', () {
    final toJson = message.toJson();
    expect(toJson, json);
  });

  test('fromJSON', () {
    final fromJson = Message.fromJson(json);
    expect(fromJson, message);
  });
}
