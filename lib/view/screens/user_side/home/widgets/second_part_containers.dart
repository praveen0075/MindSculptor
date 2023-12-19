import 'package:flutter/material.dart';

class SecondPartContainers extends StatelessWidget {
  const SecondPartContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          contaienrs(bgColor: const Color.fromARGB(255, 19, 109, 253),maintext: 'Yoga',subtext: 'Exercise'),
          contaienrs(bgColor: Colors.amber,maintext: 'Sleep',subtext: 'Music'),
        ],
      ),
    );
  }
  Widget contaienrs({Color? bgColor,String? maintext,String? subtext}) {
   return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
          color: bgColor!.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20)),
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(subtext!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}



     // Container(
          //   height: 200,
          //   width: 180,
          //   decoration: BoxDecoration(
          //       color: const Color.fromARGB(255, 19, 109, 253).withOpacity(0.7),
          //       borderRadius: BorderRadius.circular(20)),
          //   child: const Stack(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'Yoga',
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold, fontSize: 18),
          //             ),
          //             Text('Exercises')
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   height: 200,
          //   width: 180,
          //   decoration: BoxDecoration(
          //       color: Colors.amber.withOpacity(0.7),
          //       borderRadius: BorderRadius.circular(20)),
          //   child: const Stack(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'Sleep Night',
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold, fontSize: 18),
          //             ),
          //             Text('Music')
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
