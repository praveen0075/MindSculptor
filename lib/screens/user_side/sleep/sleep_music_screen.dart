
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/constants/constv.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key});

  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 18, 28, 77),
      ),
      backgroundColor:  const Color.fromARGB(255, 18, 28, 77),
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             const SizedBox(
              height: 10,
             ),
             ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/beard man sleep.jpg",width: 250,height: 260,fit: BoxFit.cover,),
             ),
             sizedBox30,
             const SizedBox(
              height: 20,
             ),
            SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 23,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Imagine Dragons",style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                          ),),
                          const SizedBox(
                            height: 10,
                          ),
                            Text("Singer Name",style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.9),
                          ),),
                        ],
                      )
                    ],
                  ),),
                  Column(
                    children: [
                      Slider(
                        min: 0,
                        max: 100,
                        value: 40,
                        onChanged: (value){},
                        activeColor: Colors.white,
                        inactiveColor: Colors.white54,
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("02:10",style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),),
                          Text("04:30",style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),)
                        ],
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     const  SizedBox(width: 30,),
                      const Icon(CupertinoIcons.backward_end_fill,color: Colors.white,),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child:  const Icon(Icons.play_arrow,color: Colors.black,),
                      ),
                      const Icon(CupertinoIcons.forward_end_fill,color: Colors.white,),
                      const SizedBox(width: 30,),
                    ],
                  )
                ],
              ),
            )
            ],
          ),
        ),
      )
    );
  }
}