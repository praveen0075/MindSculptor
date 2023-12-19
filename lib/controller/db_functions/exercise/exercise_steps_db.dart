import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

ValueNotifier<List<StepsOfExerciseModel>> stepsListNotifer=ValueNotifier([]);


class ExecriseStepsDb with ChangeNotifier{
  static String dbName = 'exercise_steps';
  static Future<void> addExerciseSteps(
      List<StepsOfExerciseModel>? tempList, String key) async {
    final db = await Hive.openBox<StepsOfExerciseModel>(dbName);
    for (var model in tempList!) {
      model
        ..exerciseKey = key
        ..stepKey = DateTime.now().millisecondsSinceEpoch.toString();
      await db.put(model.stepKey,model);  
    }
    // print(db.values.length);
  }

  static Future<void> getStepsOfExcerise(String? key)async{
    final db = await Hive.openBox<StepsOfExerciseModel>(dbName);
    stepsListNotifer.value.clear();
    for(var model in db.values){
      if(model.exerciseKey==key){
      stepsListNotifer.value.add(model);
      }
    }
    stepsListNotifer.notifyListeners();
  }


  static Future<void> updateExerciseSteps(StepsOfExerciseModel updatedStep)async{
    final exSteps = await Hive.openBox<StepsOfExerciseModel>(dbName);
    // String key = updatedStep.stepKey??'';
    exSteps.put(updatedStep.stepKey, updatedStep);
    // print('the key for updation is ${updatedStep.stepKey}');
    getStepsOfExcerise(updatedStep.exerciseKey);
    stepsListNotifer.notifyListeners();
  }

  static Future<void> deleteExerciseStep(String? stepkey)async{
    final exstep = await Hive.openBox<StepsOfExerciseModel>(dbName);
    await exstep.delete(stepkey);
  }
}



