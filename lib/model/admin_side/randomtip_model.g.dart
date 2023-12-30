// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomtip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomTipsAdapter extends TypeAdapter<RandomTips> {
  @override
  final int typeId = 1;

  @override
  RandomTips read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomTips(
      tip: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RandomTips obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tip);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomTipsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
