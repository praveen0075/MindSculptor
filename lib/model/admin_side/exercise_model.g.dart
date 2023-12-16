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
      key: fields[3] as String?,
      title: fields[0] as String,
      description: fields[1] as String,
      cardImage: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewExercises obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.cardImage)
      ..writeByte(3)
      ..write(obj.key);
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

class StepsOfExerciseModelAdapter extends TypeAdapter<StepsOfExerciseModel> {
  @override
  final int typeId = 5;

  @override
  StepsOfExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepsOfExerciseModel(
      exerciseKey: fields[0] as String?,
      imageOfStep: fields[2] as String?,
      stepKey: fields[3] as String?,
      stepText: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StepsOfExerciseModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.exerciseKey)
      ..writeByte(1)
      ..write(obj.stepText)
      ..writeByte(2)
      ..write(obj.imageOfStep)
      ..writeByte(3)
      ..write(obj.stepKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepsOfExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
