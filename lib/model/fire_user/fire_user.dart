import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_user.freezed.dart';
part 'fire_user.g.dart';

// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
class FireUser with _$FireUser {
  const factory FireUser({
    required String uid,
    required String? iconURL,
    @Default('名無し') String name,
  }) = _FireUser;
  // ignore: unused_element
  const FireUser._();
  factory FireUser.fromJson(Map<String, dynamic> json) =>
      _$FireUserFromJson(json);
}
