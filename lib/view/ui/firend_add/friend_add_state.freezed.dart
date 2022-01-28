// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'friend_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FriendAddStateTearOff {
  const _$FriendAddStateTearOff();

  _FriendAddState call({String friendUID = ''}) {
    return _FriendAddState(
      friendUID: friendUID,
    );
  }
}

/// @nodoc
const $FriendAddState = _$FriendAddStateTearOff();

/// @nodoc
mixin _$FriendAddState {
  String get friendUID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendAddStateCopyWith<FriendAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendAddStateCopyWith<$Res> {
  factory $FriendAddStateCopyWith(
          FriendAddState value, $Res Function(FriendAddState) then) =
      _$FriendAddStateCopyWithImpl<$Res>;
  $Res call({String friendUID});
}

/// @nodoc
class _$FriendAddStateCopyWithImpl<$Res>
    implements $FriendAddStateCopyWith<$Res> {
  _$FriendAddStateCopyWithImpl(this._value, this._then);

  final FriendAddState _value;
  // ignore: unused_field
  final $Res Function(FriendAddState) _then;

  @override
  $Res call({
    Object? friendUID = freezed,
  }) {
    return _then(_value.copyWith(
      friendUID: friendUID == freezed
          ? _value.friendUID
          : friendUID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FriendAddStateCopyWith<$Res>
    implements $FriendAddStateCopyWith<$Res> {
  factory _$FriendAddStateCopyWith(
          _FriendAddState value, $Res Function(_FriendAddState) then) =
      __$FriendAddStateCopyWithImpl<$Res>;
  @override
  $Res call({String friendUID});
}

/// @nodoc
class __$FriendAddStateCopyWithImpl<$Res>
    extends _$FriendAddStateCopyWithImpl<$Res>
    implements _$FriendAddStateCopyWith<$Res> {
  __$FriendAddStateCopyWithImpl(
      _FriendAddState _value, $Res Function(_FriendAddState) _then)
      : super(_value, (v) => _then(v as _FriendAddState));

  @override
  _FriendAddState get _value => super._value as _FriendAddState;

  @override
  $Res call({
    Object? friendUID = freezed,
  }) {
    return _then(_FriendAddState(
      friendUID: friendUID == freezed
          ? _value.friendUID
          : friendUID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FriendAddState
    with DiagnosticableTreeMixin
    implements _FriendAddState {
  const _$_FriendAddState({this.friendUID = ''});

  @JsonKey()
  @override
  final String friendUID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FriendAddState(friendUID: $friendUID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FriendAddState'))
      ..add(DiagnosticsProperty('friendUID', friendUID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendAddState &&
            const DeepCollectionEquality().equals(other.friendUID, friendUID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(friendUID));

  @JsonKey(ignore: true)
  @override
  _$FriendAddStateCopyWith<_FriendAddState> get copyWith =>
      __$FriendAddStateCopyWithImpl<_FriendAddState>(this, _$identity);
}

abstract class _FriendAddState implements FriendAddState {
  const factory _FriendAddState({String friendUID}) = _$_FriendAddState;

  @override
  String get friendUID;
  @override
  @JsonKey(ignore: true)
  _$FriendAddStateCopyWith<_FriendAddState> get copyWith =>
      throw _privateConstructorUsedError;
}
