// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewExercisesAdapter extends TypeAdapter<NewExercises> {
  @override
  final int typeId = 3;

  @override
  NewExercises read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewExercises(
      (fields[3] as List).cast<String>(),
      (fields[4] as List).cast<String>(),
      title: fields[0] as String,
      description: fields[1] as String,
      cardImage: fields[2] as String,
    )..timestamp = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, NewExercises obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.cardImage)
      ..writeByte(3)
      ..write(obj.steps)
      ..writeByte(4)
      ..write(obj.imageSteps)
      ..writeByte(5)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewExercisesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
