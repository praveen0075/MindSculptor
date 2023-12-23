import 'package:flutter/material.dart';
import 'package:mind_sculptor/view/screens/user_side/exercise/exercise_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/home/home_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/display/journal_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/setting_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/music/display_music/sleep_screen.dart';
import 'package:pelaicons/pelaicons.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int selectedIndex = 0;
  final pages=[
    const HomeScreen(),
    const SleepScreen(),
    const ExerciseScreen(),
    const JournalScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
        BottomNavigationBarItem(icon: Icon(Pelaicons.home_light_outline),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Pelaicons.moon_1_light_outline),label: 'Sleep'),
        BottomNavigationBarItem(icon: Icon(Pelaicons.personal_card_1_light_outline),label: 'Exercise'),
        BottomNavigationBarItem(icon: Icon(Pelaicons.pen_light_outline),label: 'Journal'),
        BottomNavigationBarItem(icon: Icon(Pelaicons.settings_light_outline),label: 'Settings'),
      ]),
      body: pages[selectedIndex], 
    );
  }
}