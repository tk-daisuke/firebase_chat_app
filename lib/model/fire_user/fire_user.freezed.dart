// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fire_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FireUser _$FireUserFromJson(Map<String, dynamic> json) {
  return _FireUser.fromJson(json);
}

/// @nodoc
class _$FireUserTearOff {
  const _$FireUserTearOff();

  _FireUser call(
      {required String uid,
      required String? iconURL,
      String name = '名無し',
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? updatedAt}) {
    return _FireUser(
      uid: uid,
      iconURL: iconURL,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  FireUser fromJson(Map<String, Object?> json) {
    return FireUser.fromJson(json);
  }
}

/// @nodoc
const $FireUser = _$FireUserTearOff();

/// @nodoc
mixin _$FireUser {
  String get uid => throw _privateConstructorUsedError;
  String? get iconURL => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FireUserCopyWith<FireUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireUserCopyWith<$Res> {
  factory $FireUserCopyWith(FireUser value, $Res Function(FireUser) then) =
      _$FireUserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String? iconURL,
      String name,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$FireUserCopyWithImpl<$Res> implements $FireUserCopyWith<$Res> {
  _$FireUserCopyWithImpl(this._value, this._then);

  final FireUser _value;
  // ignore: unused_field
  final $Res Function(FireUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? iconURL = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      iconURL: iconURL == freezed
          ? _value.iconURL
          : iconURL // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$FireUserCopyWith<$Res> implements $FireUserCopyWith<$Res> {
  factory _$FireUserCopyWith(_FireUser value, $Res Function(_FireUser) then) =
      __$FireUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String? iconURL,
      String name,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$FireUserCopyWithImpl<$Res> extends _$FireUserCopyWithImpl<$Res>
    implements _$FireUserCopyWith<$Res> {
  __$FireUserCopyWithImpl(_FireUser _value, $Res Function(_FireUser) _then)
      : super(_value, (v) => _then(v as _FireUser));

  @override
  _FireUser get _value => super._value as _FireUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? iconURL = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_FireUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      iconURL: iconURL == freezed
          ? _value.iconURL
          : iconURL // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FireUser extends _FireUser with DiagnosticableTreeMixin {
  const _$_FireUser(
      {required this.uid,
      required this.iconURL,
      this.name = '名無し',
      @ServerTimestampConverter() this.createdAt,
      @ServerTimestampConverter() this.updatedAt})
      : super._();

  factory _$_FireUser.fromJson(Map<String, dynamic> json) =>
      _$$_FireUserFromJson(json);

  @override
  final String uid;
  @override
  final String? iconURL;
  @JsonKey()
  @override
  final String name;
  @override
  @ServerTimestampConverter()
  final DateTime? createdAt;
  @override
  @ServerTimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FireUser(uid: $uid, iconURL: $iconURL, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FireUser'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('iconURL', iconURL))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FireUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.iconURL, iconURL) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(iconURL),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$FireUserCopyWith<_FireUser> get copyWith =>
      __$FireUserCopyWithImpl<_FireUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FireUserToJson(this);
  }
}

abstract class _FireUser extends FireUser {
  const factory _FireUser(
      {required String uid,
      required String? iconURL,
      String name,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? updatedAt}) = _$_FireUser;
  const _FireUser._() : super._();

  factory _FireUser.fromJson(Map<String, dynamic> json) = _$_FireUser.fromJson;

  @override
  String get uid;
  @override
  String? get iconURL;
  @override
  String get name;
  @override
  @ServerTimestampConverter()
  DateTime? get createdAt;
  @override
  @ServerTimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$FireUserCopyWith<_FireUser> get copyWith =>
      throw _privateConstructorUsedError;
}
