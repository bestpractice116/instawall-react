// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileImageAdapter extends TypeAdapter<ProfileImage> {
  @override
  final int typeId = 5;

  @override
  ProfileImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileImage(
      small: fields[0] as String,
      medium: fields[1] as String,
      large: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.small)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
