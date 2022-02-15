// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      name: json['name'] as String,
      entrant:
          (json['entrant'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: const ServerTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const ServerTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'name': instance.name,
      'entrant': instance.entrant,
      'createdAt': const ServerTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const ServerTimestampConverter().toJson(instance.updatedAt),
    };
