import 'package:hive/hive.dart';
part 'exercise_model.g.dart';

@HiveType(typeId: 3)
class NewExercises{
  @HiveField(0)
  late final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String cardImage;
  @HiveField(3)
  String? key;
 
  NewExercises({this.key,required this.title, required this.description, required this.cardImage});
 
} 

@HiveType(typeId: 5)
class  StepsOfExerciseModel{
  @HiveField(0)
 String ?exerciseKey;
  @HiveField(1)
 String ?stepText;
  @HiveField(2)
 String ?imageOfStep;
  @HiveField(3)
 String ?stepKey;
 StepsOfExerciseModel({this.exerciseKey,this.imageOfStep,this.stepKey,this.stepText});
}

