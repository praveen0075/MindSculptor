
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';

ValueNotifier< List <RandomTips>> randomTipsnotifier = ValueNotifier([]);
class RandomTipsDb with ChangeNotifier{
 static const tipBoxName = 'Random_tips'; 

 static  Future<void> getTip()async{
  final tipBox = await Hive.openBox<RandomTips>(tipBoxName);
  randomTipsnotifier.value.clear();
  randomTipsnotifier.value = tipBox.values.toList();
  randomTipsnotifier.notifyListeners();  
}

 static Future <void> addTip(RandomTips value)async{
  final tipBox = await Hive.openBox<RandomTips>(tipBoxName);
  await tipBox.add(value); 
} 

 static Future<void> deletTip(int  index)async{
  final tipBox = await Hive.openBox<RandomTips>(tipBoxName);
  await tipBox.deleteAt(index);
  await getTip();
}
}