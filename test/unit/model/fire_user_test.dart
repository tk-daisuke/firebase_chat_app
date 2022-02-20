
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  final user = FireUser(
    uid: 'uid',
    iconURL: 'iconURL',
    name: 'name',
    createdAt: DateTime(1970, 1, 1),
    updatedAt: DateTime(1970, 1, 2),
  );

  final json = <String, Object>{
    'uid': 'uid',
    'iconURL': 'iconURL',
    'name': 'name',
    'createdAt': Timestamp(-32400, 0),
    'updatedAt': Timestamp(54000, 0),
  };
  test('toJSON', () {
    final toJson = user.toJson();
    // print(toJson);
    expect(toJson, json);
  });

  test('fromJSON', () {
    final fromJson = FireUser.fromJson(json);
    expect(fromJson, user);
  });
}
