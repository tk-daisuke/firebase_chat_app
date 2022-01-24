// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FireUser _$$_FireUserFromJson(Map<String, dynamic> json) => _$_FireUser(
      uid: json['uid'] as String,
      iconURL: json['iconURL'] as String?,
      name: json['name'] as String? ?? '名無し',
    );

Map<String, dynamic> _$$_FireUserToJson(_$_FireUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'iconURL': instance.iconURL,
      'name': instance.name,
    };
