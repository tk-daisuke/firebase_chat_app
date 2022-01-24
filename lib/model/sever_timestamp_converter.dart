import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class ServerTimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const ServerTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? date) {
    return date != null ? Timestamp.fromDate(date) : null;
  }
}
