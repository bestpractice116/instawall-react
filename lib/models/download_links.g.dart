// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadLinksAdapter extends TypeAdapter<DownloadLinks> {
  @override
  final int typeId = 2;

  @override
  DownloadLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadLinks(
      download: fields[0] as String,
      downloadLocation: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.download)
      ..writeByte(1)
      ..write(obj.downloadLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
