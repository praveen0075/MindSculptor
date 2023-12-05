import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/journal/journal_full_view.dart';
import 'package:mind_sculptor/screens/user_side/journal/journal_write_screen.dart';
import 'package:mind_sculptor/screens/user_side/logIn/constv.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  // final List<Color>cardColors = [
  //   Colors.red.shade400,
  //   Colors.yellow.shade400,
  //   Colors.green.shade400,
  // ];
 
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const JournalWriteScreen(),));
      },child:const Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: tc1,
        elevation: 0,
        title: const Text('Journal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 2),),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            tc1,lg1,lg2
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          )
        ),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
              height: 125,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalviewScreen(),));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                            Text('10/11/2023')
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 1,
                        color: Colors.black, 
                      ),
                      const Flexible(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('It is a long established fact that a readerLorem Ipsum is that it has amore-or-less It is a long established fact that a reader'),
                      ),),
                    ],
                  ),  
                ),
              ),
             ),
            ),),
        )
      )
    );
  }
}