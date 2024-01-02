import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/db_functions/random_tips/random_tipdb_functions.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';

class RandomTipsInHomeScreen extends StatefulWidget {
  const RandomTipsInHomeScreen({super.key});

  @override
  State<RandomTipsInHomeScreen> createState() => _RandomTipsInHomeScreenState();
}class _RandomTipsInHomeScreenState extends State<RandomTipsInHomeScreen> {
  List<RandomTips> rTipsList = [];
  List<int> displayedIndexes = [];
  Random random = Random();

  @override
  void initState() {
    super.initState();
    getRtips();
  }

  void getRtips() async {
    final randomTipList = await RandomTipsDb.getTip();
    setState(() {
      rTipsList = randomTipList;
      displayedIndexes = List.generate(rTipsList.length, (index) => index);
      displayedIndexes.shuffle(); 
    });
  }

  int getUniqueIndex() {
    if (displayedIndexes.isEmpty) {
      displayedIndexes = List.generate(rTipsList.length, (index) => index);
      displayedIndexes.shuffle(); 
    }
    return displayedIndexes.removeLast();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            elevation: 5,
            child: Container(
              height: 140,
            width: double.maxFinite,
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage("assets/images/tip1image.jpg"),fit: BoxFit.cover),
                color: const Color.fromARGB(255, 13, 119, 195).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
               child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        rTipsList.isNotEmpty ? rTipsList[getUniqueIndex()].tip : '"Feelings come and go like clouds in a windy sky. Conscious breathing is my anchor."' ,
                        style: const TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/images/tip2image.jpg"),fit: BoxFit.cover),
                  color: const Color.fromARGB(255, 13, 119, 195).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)),
            
              height: 140,
              width: double.maxFinite,
              child: Padding(
                padding:const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        rTipsList.isNotEmpty ? rTipsList[getUniqueIndex()].tip : '"Kindness is a language that everyone understands, and it costs nothing to speak."' ,
                        style: const TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/images/tip3image.jpg"),fit: BoxFit.cover),
                  color: const Color.fromARGB(255, 13, 119, 195).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)),
              height: 140,
              width: double.maxFinite,
              child: Padding(
                padding:const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        rTipsList.isNotEmpty ? rTipsList[getUniqueIndex()].tip : '"Practice gratitude daily; it turns what we have into enough."' ,
                        style: const TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
