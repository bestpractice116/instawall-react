// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UrlsAdapter extends TypeAdapter<Urls> {
  @override
  final int typeId = 1;

  @override
  Urls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Urls(
      full: fields[0] as String,
      regular: fields[1] as String,
      small: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Urls obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.full)
      ..writeByte(1)
      ..write(obj.regular)
      ..writeByte(2)
      ..write(obj.small);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
