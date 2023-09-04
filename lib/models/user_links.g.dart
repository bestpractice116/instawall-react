// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLinksAdapter extends TypeAdapter<UserLinks> {
  @override
  final int typeId = 4;

  @override
  UserLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLinks(
      following: fields[0] as String,
      followers: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.following)
      ..writeByte(1)
      ..write(obj.followers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
