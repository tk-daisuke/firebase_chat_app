import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/sever_timestamp_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
class Message with _$Message {
  const factory Message({
    required String text,
    required String postUserID,
    @ServerTimestampConverter() required DateTime? createdAT,
  }) = _Message;
  // ignore: unused_element
  const Message._();
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
