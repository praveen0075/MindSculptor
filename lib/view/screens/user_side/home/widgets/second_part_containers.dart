import 'package:flutter/material.dart';
import 'package:mind_sculptor/view/screens/user_side/exercise/exercise_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/music/display_music/sleep_screen.dart';

class SecondPartContainers extends StatelessWidget {
  const SecondPartContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const ExerciseScreen(),));
            },
            child: contaienrs(bgColor: const Color.fromARGB(255, 19, 109, 253),maintext: 'Mindfulness',subtext: 'Exercise')),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepScreen(),));
            },
            child: contaienrs(bgColor: Colors.amber,maintext: 'Sleep',subtext: 'Music')),
        ],
      ),
    );
  }
  Widget contaienrs({Color? bgColor,String? maintext,String? subtext}) {
   return Card(
    elevation: 20,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
     child: Container(
        height: 200,
        width: 180,
        decoration: BoxDecoration(
            color: bgColor!.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)
           ),
        child:  Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maintext!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),
                  ),
                  Text(subtext!)
                ],
              ),
            ),
          ],
        ),
      ),
   );
  }
}

