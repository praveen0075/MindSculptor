import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/full_view/journal_full_view.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/journal%20write/journal_write_screen.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const JournalWriteScreen(),));
      },child:const Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: tc1,
        elevation: 0,
        title:  Text('Journal',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
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
                  // color: Colors.yellow.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  child: const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Title',style: TextStyle(fontSize: 20),),
                            Text('12/12/12')
                          ],
                        ),
                        sizedBox10,
                        Text('safdjalsjfljal;jfdsaksfhkhklashfdklhaksfhdkhakfhkdahkfhakhsdfkhakhfkhdakhfkahkdhkahfkhakshdfkhaskdhfhaskd')
                      ],
                    ),
                  )
                ),
              ),
             ),
            ),),
        )
      )
    );
  }
}