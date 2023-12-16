import 'package:flutter/material.dart'; 
import 'package:mind_sculptor/constants/theme.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';
import 'package:mind_sculptor/model/admin_side/songs_model.dart';
import 'package:mind_sculptor/model/user_model.dart';
import 'package:mind_sculptor/screens/user_side/splash/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();  
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(RandomTipsAdapter());
  // Hive.registerAdapter(MusicAdapter());
  Hive.registerAdapter(NewExercisesAdapter());
  Hive.registerAdapter(SongsAdapter());
  Hive.registerAdapter(StepsOfExerciseModelAdapter());
  await Hive.openBox<User>('user_details');
  await Hive.openBox<RandomTips>('randomtips');
  // await Hive.openBox<Music>('sleep_music');
  // await Hive.openBox<NewExercises>('exercises');
  // await Hive.openBox<Songs>('songs');
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