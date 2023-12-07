import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

ValueNotifier<List<NewExercises>> exerciseNotifier = ValueNotifier([]);

class ExerciseDb with ChangeNotifier{
  static const String excriseDb = 'exercises';

  static Future<void> getExersise() async {
    final dbOfExercise = await Hive.openBox<NewExercises>(excriseDb);   
    exerciseNotifier.value.clear();
    exerciseNotifier.value = dbOfExercise.values.toList();
    exerciseNotifier.notifyListeners();
  }
  
   static Future<bool> addExercise(NewExercises model)async{
    final db = await Hive.openBox<NewExercises>(excriseDb);
    try {
      await db.add(model);
      return true;
    } catch (e) {
      return false;
    }
   }
    static Future<void> deleteExercise(int index) async {
    final db = await Hive.openBox<NewExercises>(excriseDb);
    await db.deleteAt(index);
     await getExersise();
  }
}
