// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicAdapter extends TypeAdapter<Music> {
  @override
  final int typeId = 2;

  @override
  Music read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Music(
      thumbnailImagePath: fields[0] as String,
      musicTitle: fields[1] as String,
      duration: fields[2] as String,
      musicFilePath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Music obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.thumbnailImagePath)
      ..writeByte(1)
      ..write(obj.musicTitle)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.musicFilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
