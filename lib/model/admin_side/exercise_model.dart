import 'package:hive/hive.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 3)
class NewExercises{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String cardImage;
  @HiveField(3)
  final List<String> steps;
  @HiveField(4)
  final List<String> imageSteps;
  @HiveField(5)
  DateTime timestamp;

  NewExercises(this.steps, this.imageSteps, {required this.title, required this.description, required this.cardImage}): timestamp = DateTime.now(); 
  
} 