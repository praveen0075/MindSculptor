
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';

ValueNotifier< List <RandomTips>> randomTipsnotifier = ValueNotifier([]);
class RandomTipsDb with ChangeNotifier{
 static const tipBoxName = 'Random_tips'; 
 static List<String> rtips = [];

 static  Future<List<RandomTips>> getTip()async{
  final tipBox = await Hive.openBox<RandomTips>(tipBoxName);
  randomTipsnotifier.value.clear();
  randomTipsnotifier.value = tipBox.values.toList();
  final list = tipBox.values.toList();
  randomTipsnotifier.notifyListeners();  
  return list;
}

 static Future <void> addTip(RandomTips value)async{
  final tipBox = await Hive.openBox<RandomTips>(tipBoxName);
  await tipBox.add(value);
  rtips.add(value.tip);
} 

 static Future<void> deletTip(int  index)async{
  final tipBox = await Hive.openBox<RandomTips>(tipBoxName);
  await tipBox.deleteAt(index);
  await getTip();
}

static Future <void> updateTip(RandomTips randomtips)async{
 final updatedtipBox = await Hive.openBox<RandomTips>(tipBoxName);
 String key = randomtips.tip;
 updatedtipBox.put(key, randomtips);
}
}