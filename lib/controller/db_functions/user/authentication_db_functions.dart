import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';

ValueNotifier <List<User>> userNotifier = ValueNotifier([]);

class UserDb with ChangeNotifier{
  static const String userDb = "user_details";
  static String? userId;

  static Future <void> addUser(User newUser)async{
    final userBox = await Hive.openBox<User>(userDb); 
    final timeKey = DateTime.now().millisecondsSinceEpoch.toString();
    print(timeKey);
    // newUser.key = timeKey;  
    await userBox.put(timeKey, newUser);
    userId = timeKey;
    print(userId);
  }

  static Future <void> getUser()async{
    final userBox = await Hive.openBox<User>(userDb);
    userNotifier.value.clear();
    userNotifier.value = userBox.values.toList();
    userNotifier.notifyListeners();
  }

  static Future<User?> getUserById(String userID)async{
     final userBox = await Hive.openBox<User>(userDb);  
      final user = userBox.values.firstWhereOrNull((element) => element.key == userID);
     return user;
  }


  static Future <void> updateUser(User updateUser)async{
    final userupdateBox = await Hive.openBox<User>(userDb);
    String key = updateUser.key??'';
    userupdateBox.put(key, updateUser);
    // getUser();
  }
}