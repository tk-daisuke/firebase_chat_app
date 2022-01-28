import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'friend_add_state.freezed.dart';


// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
class FriendAddState with _$FriendAddState {
  const factory FriendAddState({
    @Default('') String friendUID,
  }) = _FriendAddState;
}
