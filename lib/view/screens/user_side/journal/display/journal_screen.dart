import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
// import 'package:mind_sculptor/model/user_side/journal_model.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/display/journal_card.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/full_view/journal_full_view.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/journal%20write/journal_write_screen.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    super.initState();
    JournalDB.getjournal();
  }

  String? smallDescription;
  String? journalTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JournalWriteScreen(),
                  ));
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(
          backgroundColor: tc1,
          elevation: 0,
          title: Text('Journal',
              style:
                  TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
          centerTitle: true,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [tc1, lg1, lg2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ValueListenableBuilder(
                valueListenable: journalNotifier,
                builder: (context, journalList, child) {
                  return SlidableAutoCloseBehavior(
                    closeWhenOpened: true,
                    child: ListView.builder(
                      itemCount: journalList.length,
                      itemBuilder: (context, index) {
                        var journalValue = journalList[index];
                        String title = journalValue.title;
                        if (title.length >= 30) {
                          journalTitle = "${title.substring(0, 30)}....";
                        } else {
                          journalTitle = title;
                        }
                        String description = journalValue.paraghraph;
                        if (description.length >= 60) {
                          smallDescription =
                              "${description.substring(0, 60)}....";
                        } else {
                          smallDescription = description;
                        }
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            // child: SizedBox(
                            // height: 125,
                            child: InkWell(
                              onTap: () {
                                print(journalValue.dayDate);
                                print(journalValue.paraghraph);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           JournalviewScreen(journalModel: journalValue),   
                                    ));
                              },
                              child: Slidable(
                                  endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                            label: 'Delete?',
                                            backgroundColor: Colors.red,
                                            icon: Icons.delete_forever,
                                            onPressed: (context) {
                                              return onDismissed(journalValue.journalKey??'');
                                            })
                                      ]),
                                  child: JournalItemCard(
                                    // journalvalue: journalValue,
                                    smallDescription: smallDescription!,
                                    journalTitle: journalTitle!,
                                    dateAdded: journalValue.dayDate,
                                  )),
                              // child: Card(
                              //   // color: Colors.yellow.shade100,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   elevation: 10,
                              //   child:  Padding(
                              //     padding: const EdgeInsets.all(15.0),
                              //     child: Column(
                              //       children: [
                              //         Row(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Text(journalValue.title,style:const TextStyle(fontSize: 20),),
                              //             // Text(DateFormat('dd/mm/yyyy').format(journalValue.dayDate),style: TextStyle(color: Colors.red),)
                              //             // Text(DateFormat('dd/mm/yyyy ').format(journalValue.date as DateTime))
                              //           ],
                              //         ),
                              //         sizedBox10,
                              //         Text(smallDescription??''),
                              //       ],
                              //     ),
                              //   )
                              // ),
                            ));
                        //  ),
                        // );
                      },
                    ),
                  );
                },
              ),
            )));
  }

  void onDismissed(String key) {
    JournalDB.deleteJournal(key);
  }

  // String smallDescription(String description){
  //   if(description.length > 30){
  //     return '${description.substring(0,30)}....';
  //   }else{
  //     return description;
  //   }
  // }
}
