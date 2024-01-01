
import 'package:flutter/material.dart';

class MoodContainers extends StatefulWidget {
  const MoodContainers({super.key});

  @override
  State<MoodContainers> createState() => _MoodContainersState();
}

class _MoodContainersState extends State<MoodContainers> {
 int selectedIndex = -1; 

  List<String> moods = ['Happy', 'Sad', 'Good', 'Angry', 'Stressed', 'Peaceful', 'Relaxed'];
  List<String> emojis = ['😁', '😢', '👍', '😡', '😩', '😌', '😊'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            moods.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  if (selectedIndex == index) {
                    selectedIndex = -1;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: selectedIndex == index
                    ? currentMoodEmoji(emoji: emojis[index]) 
                    : currentMood(text: moods[index]), 
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget currentMood({String? text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget currentMoodEmoji({String? emoji}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          // color: Color.fromARGB(245, 253, 253, 114),
          border: Border.all(color: Colors.white  ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            emoji!,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}


