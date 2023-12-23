import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mind_sculptor/controller/db_functions/exercise/exercise_steps_db.dart' ;
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

ValueNotifier<List<NewExercises>> exerciseNotifier = ValueNotifier([]);

class ExerciseDb with ChangeNotifier{
  static const String excriseDb = 'exercises';

  static Future<void> getExersise() async {
    final dbOfExercise = await Hive.openBox<NewExercises>(excriseDb);     
    exerciseNotifier.value.clear();
    exerciseNotifier.value = dbOfExercise.values.toList();exerciseNotifier.notifyListeners();
  }
  
   static Future<void> addExercise(NewExercises newExercisemodel,List<StepsOfExerciseModel>? tempList)async{
    final exerciseBox = await Hive.openBox<NewExercises>(excriseDb);
    final timekey = DateTime.now().millisecondsSinceEpoch.toString();
    newExercisemodel.key=timekey;
    await exerciseBox.put(timekey, newExercisemodel);
    await ExecriseStepsDb.addExerciseSteps(tempList,timekey); 
    // print('the key of adding a exercise is $timekey');
   }  
  
   static Future<void> updateExercise(NewExercises editedExercise)async{
    final updateBox = await  Hive.openBox<NewExercises>(excriseDb);
    String key=editedExercise.key??'';
    updateBox.put(key, editedExercise);
    getExersise();
   }

    static Future<void> deleteExercise(String? key) async {
    final db = await Hive.openBox<NewExercises>(excriseDb);
    await db.delete(key);
    //  print('the key of deleting a exercise is $key');
    await getExersise();
  }
} 
