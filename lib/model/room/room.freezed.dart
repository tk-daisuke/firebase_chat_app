// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
class _$RoomTearOff {
  const _$RoomTearOff();

  _Room call(
      {required String name,
      required List<dynamic> entrant,
      @ServerTimestampConverter() required DateTime? createdAT,
      @ServerTimestampConverter() required DateTime? updatedAT}) {
    return _Room(
      name: name,
      entrant: entrant,
      createdAT: createdAT,
      updatedAT: updatedAT,
    );
  }

  Room fromJson(Map<String, Object?> json) {
    return Room.fromJson(json);
  }
}

/// @nodoc
const $Room = _$RoomTearOff();

/// @nodoc
mixin _$Room {
  String get name => throw _privateConstructorUsedError;
  List<dynamic> get entrant => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get createdAT => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get updatedAT => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res>;
  $Res call(
      {String name,
      List<dynamic> entrant,
      @ServerTimestampConverter() DateTime? createdAT,
      @ServerTimestampConverter() DateTime? updatedAT});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res> implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  final Room _value;
  // ignore: unused_field
  final $Res Function(Room) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? entrant = freezed,
    Object? createdAT = freezed,
    Object? updatedAT = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entrant: entrant == freezed
          ? _value.entrant
          : entrant // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAT: createdAT == freezed
          ? _value.createdAT
          : createdAT // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAT: updatedAT == freezed
          ? _value.updatedAT
          : updatedAT // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) then) =
      __$RoomCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      List<dynamic> entrant,
      @ServerTimestampConverter() DateTime? createdAT,
      @ServerTimestampConverter() DateTime? updatedAT});
}

/// @nodoc
class __$RoomCopyWithImpl<$Res> extends _$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(_Room _value, $Res Function(_Room) _then)
      : super(_value, (v) => _then(v as _Room));

  @override
  _Room get _value => super._value as _Room;

  @override
  $Res call({
    Object? name = freezed,
    Object? entrant = freezed,
    Object? createdAT = freezed,
    Object? updatedAT = freezed,
  }) {
    return _then(_Room(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entrant: entrant == freezed
          ? _value.entrant
          : entrant // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAT: createdAT == freezed
          ? _value.createdAT
          : createdAT // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAT: updatedAT == freezed
          ? _value.updatedAT
          : updatedAT // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Room extends _Room with DiagnosticableTreeMixin {
  const _$_Room(
      {required this.name,
      required this.entrant,
      @ServerTimestampConverter() required this.createdAT,
      @ServerTimestampConverter() required this.updatedAT})
      : super._();

  factory _$_Room.fromJson(Map<String, dynamic> json) => _$$_RoomFromJson(json);

  @override
  final String name;
  @override
  final List<dynamic> entrant;
  @override
  @ServerTimestampConverter()
  final DateTime? createdAT;
  @override
  @ServerTimestampConverter()
  final DateTime? updatedAT;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Room(name: $name, entrant: $entrant, createdAT: $createdAT, updatedAT: $updatedAT)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Room'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('entrant', entrant))
      ..add(DiagnosticsProperty('createdAT', createdAT))
      ..add(DiagnosticsProperty('updatedAT', updatedAT));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Room &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.entrant, entrant) &&
            const DeepCollectionEquality().equals(other.createdAT, createdAT) &&
            const DeepCollectionEquality().equals(other.updatedAT, updatedAT));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(entrant),
      const DeepCollectionEquality().hash(createdAT),
      const DeepCollectionEquality().hash(updatedAT));

  @JsonKey(ignore: true)
  @override
  _$RoomCopyWith<_Room> get copyWith =>
      __$RoomCopyWithImpl<_Room>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomToJson(this);
  }
}

abstract class _Room extends Room {
  const factory _Room(
      {required String name,
      required List<dynamic> entrant,
      @ServerTimestampConverter() required DateTime? createdAT,
      @ServerTimestampConverter() required DateTime? updatedAT}) = _$_Room;
  const _Room._() : super._();

  factory _Room.fromJson(Map<String, dynamic> json) = _$_Room.fromJson;

  @override
  String get name;
  @override
  List<dynamic> get entrant;
  @override
  @ServerTimestampConverter()
  DateTime? get createdAT;
  @override
  @ServerTimestampConverter()
  DateTime? get updatedAT;
  @override
  @JsonKey(ignore: true)
  _$RoomCopyWith<_Room> get copyWith => throw _privateConstructorUsedError;
}
