
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier <List<User>> userNotifier = ValueNotifier([]);

class UserDb with ChangeNotifier{
  static const String userDb = "user_details";
  // static const String saveUserKey = 'SaveUserKey';

  static Future <void> addUser(User newUser)async{
    final userBox = await Hive.openBox<User>(userDb); 
    final timeKey = DateTime.now().millisecondsSinceEpoch.toString();
    newUser.key = timeKey;  
    await userBox.put(timeKey, newUser);
    // await saveTheKey(key: newUser.key!);
  }

  // static Future <void> saveTheKey({required String key}) async{
  //   SharedPreferences sharedpref = await SharedPreferences.getInstance();
  //   sharedpref.setString(saveUserKey, key);
  // }

  // static Future <String?> getSavedKey()async{
  //   SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //   return sharedPref.getString(saveUserKey);
  // }

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

  // static Future<String?> getUserid(User user)async{
    
  // }


  static Future <void> updateUser(User updateUser)async{
    final userupdateBox = await Hive.openBox<User>(userDb);
    String key = updateUser.key??'';
    userupdateBox.put(key, updateUser);
    // getUser();
  }

  static Future <void> deleteProfilePic(User currentUser)async{
    final userobx = await Hive.openBox<User>(userDb);
    String key = currentUser.key??"";
    currentUser.profilepicPath = null;
    userobx.put(key, currentUser);
  }
}