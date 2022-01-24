// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      name: json['name'] as String,
      entrant:
          (json['entrant'] as List<dynamic>).map((e) => e as String).toList(),
      createdAT: const ServerTimestampConverter()
          .fromJson(json['createdAT'] as Timestamp?),
      updatedAT: const ServerTimestampConverter()
          .fromJson(json['updatedAT'] as Timestamp?),
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'name': instance.name,
      'entrant': instance.entrant,
      'createdAT': const ServerTimestampConverter().toJson(instance.createdAT),
      'updatedAT': const ServerTimestampConverter().toJson(instance.updatedAT),
    };
