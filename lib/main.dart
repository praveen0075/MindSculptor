import 'package:flutter/material.dart'; 
import 'package:mind_sculptor/controller/constants/theme.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';
import 'package:mind_sculptor/view/screens/user_side/splash/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();  
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(RandomTipsAdapter());
  Hive.registerAdapter(NewExercisesAdapter());
  Hive.registerAdapter(SongsAdapter());
  Hive.registerAdapter(StepsOfExerciseModelAdapter());
  Hive.registerAdapter(JournalAdapter());
//  await Hive.openBox<User>("user_details");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind Sculptor',
      theme: themeData,
      home: const SplashScreen(),
    );
  }
}