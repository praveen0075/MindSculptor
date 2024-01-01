import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
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
  late List<Journal> allJournals = journalNotifier.value;
  late List<Journal> filteredJournals = [];
  
  Icon customIcon = const Icon(CupertinoIcons.search);
  Widget customSearchBar =  Text('Journal',style:
  TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily));

  @override
  void initState() {
    super.initState();
    JournalDB.getjournal();
    // getUserId();    // fetchJournal();
  }

  // void getUserId()async{
  //   SharedPreferences sharepref = await SharedPreferences.getInstance();
  //   userId = sharepref.getString('userEntered');
  // }

  

  
void filterSearchResult(String query){
  if(query.isEmpty) {
    setState(() {
      filteredJournals = allJournals;
      journalNotifier.value = filteredJournals;
    });
  } else {
    setState(() {
      filteredJournals = allJournals.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();
      journalNotifier.value = filteredJournals;
    });
  }
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
          actions: [
            IconButton(onPressed: (){
               setState(() {
              if(customIcon.icon == CupertinoIcons.search){
                customIcon = const Icon(Icons.cancel_outlined);
                customSearchBar =  TextField(
                  onChanged: (value) {
                    filterSearchResult(value);
                  },
                  decoration: const InputDecoration.collapsed(
                    hintText: 'search..',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 16.0,),
                );
              } else {
                customIcon = const Icon(CupertinoIcons.search,color: Colors.white,);
                customSearchBar = Text(
                  'Journal',
                  style: TextStyle(
                    fontFamily: GoogleFonts.archivoBlack().fontFamily,
                  ),
                );
                // Clear search results when search bar is closed
                filterSearchResult('');
              }
            });
          }, icon: customIcon)
          ],
          backgroundColor: tc1,
          elevation: 0,
          title:customSearchBar,
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
                  filteredJournals = journalList;
                  return SlidableAutoCloseBehavior(
                    closeWhenOpened: true,
                    child: filteredJournals.isEmpty? const Center(child: Text('Journal is empty',style: TextStyle(color: Colors.white),)): ListView.builder(
                      itemCount: filteredJournals.length,
                      itemBuilder: (context, index) {
                        var journalValue = filteredJournals[index];
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
                            child: InkWell(
                              onTap: () {
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
                            ));
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
}




  // void fetchJournal()async{
  //   List<Journal> journal  = await JournalDB.getjournal();
  //   setState(() {
  //     allJournals = journal;
  //     filteredJournals = List.from(allJournals);
  //   });
  // }

  // void filterJournals(String query){
  //   setState(() {
  //     if(query.isEmpty){
  //       filteredJournals = List.from(allJournals);
  //     }else{
  //       filteredJournals = allJournals.where((element) {
  //         final title = element.title.toLowerCase();
  //         // final date = element.dayDate.toString();
  //         final searchLower = query.toLowerCase();
  //         print(filteredJournals);
  //         return title.contains(searchLower) ;
  //       }).toList();
  //     }
  //   });
  // }




  // String smallDescription(String description){
  //   if(description.length > 30){
  //     return '${description.substring(0,30)}....';
  //   }else{
  //     return description;
  //   }
  // }



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