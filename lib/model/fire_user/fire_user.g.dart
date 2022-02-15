// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FireUser _$$_FireUserFromJson(Map<String, dynamic> json) => _$_FireUser(
      uid: json['uid'] as String,
      iconURL: json['iconURL'] as String?,
      name: json['name'] as String? ?? '名無し',
      createdAt: const ServerTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const ServerTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_FireUserToJson(_$_FireUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'iconURL': instance.iconURL,
      'name': instance.name,
      'createdAt': const ServerTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const ServerTimestampConverter().toJson(instance.updatedAt),
    };
