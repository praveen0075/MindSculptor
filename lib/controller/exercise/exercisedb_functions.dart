import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mind_sculptor/controller/exercise/exercise_steps_db.dart' ;
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
    print('the key of adding a exercise is $timekey');
   }  

   static Future<void> updateExercise(NewExercises editedExercise)async{
    final updateBox = await  Hive.openBox<NewExercises>(excriseDb);
    String key=editedExercise.key??'';
    updateBox.put(key, editedExercise);
    getExersise();
   }

  //  static Future<void>updateExercise(NewExercises editedExercise,String? exercisekey)async{
  //   final updateBox = await Hive.openBox<NewExercises>(excriseDb);
  //   await updateBox.put(exercisekey, editedExercise);
  //   print('the updatonn occured with time key $exercisekey');
  //  }


//    remainderEdit(RemainderModel item){
//   print("the functionis called");
//   final remainder_db=Hive.box<RemainderModel>(auth.currentUser!.uid);
//   int key=item.id??0;
//   remainder_db.put(key, item);
//   remainderGetFromDB();
// }
   
    static Future<void> deleteExercise(String? key) async {
    final db = await Hive.openBox<NewExercises>(excriseDb);
    await db.delete(key);
     print('the key of deleting a exercise is $key');
    await getExersise();
  }
} 





// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

// ValueNotifier<List<NewExercises>> exerciseNotifier = ValueNotifier([]);

// class ExerciseDb with ChangeNotifier{
//   static const String excriseDb = 'exercises';

//   static Future<void> getExersise() async {
//     final dbOfExercise = await Hive.openBox<NewExercises>(excriseDb);     
//     exerciseNotifier.value.clear();
//     exerciseNotifier.value = dbOfExercise.values.toList();exerciseNotifier.notifyListeners();
//   }
  
//    static Future<bool> addExercise(NewExercises newExercisemodel)async{
//     final db = await Hive.openBox<NewExercises>(excriseDb);
//     try {
//       int exercisekey = await db.add(newExercisemodel);
//       db.put(exercisekey, newExercisemodel);
//       return true;
//     } catch (e) {
//       return false;
//     } 
//    }  
//     static Future<void> deleteExercise(int index) async {
//     final db = await Hive.openBox<NewExercises>(excriseDb);
//     await db.delete(index);
//     await getExersise();
//   }
// } 
