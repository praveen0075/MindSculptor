
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




//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: List.generate(
//             4,
//             (index) => InkWell(
//               onTap: () {
//                 if (stats[index] == AnimationStatus.dismissed) {
//                   _controllers[index].forward();
//                 } else {
//                   _controllers[index].reverse();
//                 }
//               },
//               child: AnimatedBuilder(
//                 animation: _animations[index],
//                 builder: (context, child) {
//                   return Transform(
//                     alignment: FractionalOffset.center,
//                     transform: Matrix4.identity()..setEntry(2, 1, 0.0015)..rotateY(pi * _animations[index].value),
//                     child: Card(
//                       child: _animations[index].value <= 0.5
//                           ? currentMood(text: 'Happy')
//                           : currentMoodemoji(emoji: '😁'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



  //  late List<AnimationController> _controllers;
  // late List<Animation> _animations;
  // late List<AnimationStatus> stats;

  //  @override
  // void initState() {
  //   super.initState();
  //   _controllers = List.generate(4, (index) => AnimationController(vsync: this, duration: const Duration(seconds: 1)));
  //   _animations = _controllers.map((controller) => Tween(end: 1.0, begin: 0.0).animate(controller)).toList();
  //   stats = List.filled(4, AnimationStatus.dismissed);
  // }

  //   @override
  // void dispose() {
  //   for (var controller in _controllers) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }





// import 'dart:math';

// import 'package:flutter/material.dart';

// class MoodContainers extends StatefulWidget {
//   const MoodContainers({super.key});

//   @override
//   State<MoodContainers> createState() => _MoodContainersState();
// }

// class _MoodContainersState extends State<MoodContainers> with TickerProviderStateMixin {
//     late AnimationController _controller;
//   late Animation _animation;
//   AnimationStatus stat = AnimationStatus.dismissed;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this,duration: const Duration(seconds: 1));
//     _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)..addListener(() {
//       setState(() {
        
//       });
//     })..addStatusListener((status) {
//       stat = status;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             InkWell(
//               onTap: (){
//                 if(stat == AnimationStatus.dismissed){
//                   _controller.forward();
//                 }else{
//                   _controller.reverse();
//                 }
//               },
//               child: Transform(alignment: FractionalOffset.center,
//                 transform: Matrix4.identity()..setEntry(2, 1, 0.0015)..rotateY(pi * _animation.value),child: Card(child:  _animation.value <=0.5 ? currentMood(text: 'Happy'):currentMoodemoji(emoji: '😁')),)),
//                 InkWell(
//               onTap: (){
//                 if(stat == AnimationStatus.dismissed){
//                   _controller.forward();
//                 }else{
//                   _controller.reverse();
//                 }
//               },
//               child: Transform(alignment: FractionalOffset.center,
//                 transform: Matrix4.identity()..setEntry(2, 1, 0.0015)..rotateY(pi * _animation.value),child: Card(child:  _animation.value <=0.5 ? currentMood(text: 'Happy'):currentMoodemoji(emoji: '😁')),)),
//                 InkWell(
//               onTap: (){
//                 if(stat == AnimationStatus.dismissed){
//                   _controller.forward();
//                 }else{
//                   _controller.reverse();
//                 }
//               },
//               child: Transform(alignment: FractionalOffset.center,
//                 transform: Matrix4.identity()..setEntry(2, 1, 0.0015)..rotateY(pi * _animation.value),child: Card(child:  _animation.value <=0.5 ? currentMood(text: 'Happy'):currentMoodemoji(emoji: '😁')),)),
//                 InkWell(
//               onTap: (){
//                 if(stat == AnimationStatus.dismissed){
//                   _controller.forward();
//                 }else{
//                   _controller.reverse();
//                 }
//               },
//               child: Transform(alignment: FractionalOffset.center,
//                 transform: Matrix4.identity()..setEntry(2, 1, 0.0015)..rotateY(pi * _animation.value),child: Card(child:  _animation.value <=0.5 ? currentMood(text: 'Happy'):currentMoodemoji(emoji: '😁')),)),
            
//             // currentMood(text: 'Sad'),
//             // currentMood(text: 'Angry'),
//             // currentMood(text: 'Good'),
//             // currentMood(text: 'Okay'),
//             // currentMood(text: 'others'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget currentMood({String? text}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       height: 45,
//       width: 100,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(15)),
//       ),
//       child: Center(
//           child: Text(
//         text!,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       )),
//     ),
//   );
// }

// Widget currentMoodemoji({String? emoji}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       height: 45,
//       width: 100,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(15)),
//       ),
//       child: Center(
//           child: Text(emoji!,style: TextStyle(fontSize: 20),)
//       ),
//     ),
//   );
// }

