
import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/user_side/home/widgets/first_container.dart';
import 'package:mind_sculptor/view/screens/user_side/home/widgets/randomtips_part.dart';
import 'package:mind_sculptor/view/screens/user_side/home/widgets/second_part_containers.dart';
import 'package:mind_sculptor/view/screens/user_side/home/widgets/third_part_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child:  const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 FirstContainer(),
                 sizedBox10,
                 SecondPartContainers(),
                 JournalWriteSection(),
                 Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Row(children: [
                    Text(
                      "Today's Mindfulness Tips",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
                 RandomTipsInHomeScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

