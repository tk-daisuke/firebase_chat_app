import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/sever_timestamp_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
class Room with _$Room {
  const factory Room({
    required String name,
    required List<String> entrant,
    @ServerTimestampConverter()  DateTime? createdAt,
    @ServerTimestampConverter()  DateTime? updatedAt,
  }) = _Room;
  // ignore: unused_element
  const Room._();
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
