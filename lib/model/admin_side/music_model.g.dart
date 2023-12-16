// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongsAdapter extends TypeAdapter<Songs> {
  @override
  final int typeId = 4;

  @override
  Songs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Songs(
      musicKey: fields[3] as String?,
      title: fields[0] as String,
      image: fields[1] as String,
      musicPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Songs obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.musicPath)
      ..writeByte(3)
      ..write(obj.musicKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
