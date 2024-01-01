

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';
// import 'package:mind_sculptor/view/screens/user_side/journal/full_view/frontview_card.dart';
// import 'package:mind_sculptor/view/screens/user_side/journal/full_view/rearview_card.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:mind_sculptor/controller/constants/constv.dart';

class JournalviewScreen extends StatefulWidget {
  const JournalviewScreen({super.key, required this.journalModel});
  final Journal journalModel;
  // final DateTime journalDate;

  @override
  State<JournalviewScreen> createState() => _JournalviewScreenState();
}

class _JournalviewScreenState extends State<JournalviewScreen> {
  TextEditingController journaltitleController = TextEditingController();

  String? editedtitle;
  String? editedParagraph;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Journal',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            saveEditedJournalToDb();
           
          }, icon: const Icon(Icons.done))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                // child: Frontviewcard(widget: widget),
                child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScrollConfiguration(
          behavior:const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration:const InputDecoration.collapsed(
                    hintText: 'Title',
                  ),
                  controller:
                   TextEditingController(text: widget.journalModel.title),
                      // journaltitleController = widget.journalModel.title.toString()
                  // widget.journalModel.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,fontWeight: FontWeight.bold),
                  onChanged: (value) {
               
                      editedtitle = value;
                  
                  },
                ),
                sizedBox5,
                Row(
                  children: [
                            Text(
                      DateFormat('dd/MM/yyyy')
                            .format(date??widget.journalModel.dayDate),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                            sizedBox10w,
                           InkWell(
                            onTap: () {
                               showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now())
                              .then((value) {
                            setState(() {
                              if (value != null) {
                                 date = value;
                                // widget.onselectedDate(date);
                              }
                            });
                          });
                            },
                            child: const Icon(CupertinoIcons.calendar,color: Colors.black,))
                          ],
                ),  
                sizedBox20,
                SingleChildScrollView(
                  child: Column(
                    // color: Colors.blue,
                    children: [
                      TextField(
                        decoration: const InputDecoration.collapsed(hintText: 'Type here....'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: TextEditingController(text: widget.journalModel.paraghraph),
                        // widget.journalModel.paraghraph,  
                        style: const TextStyle(fontSize: 15),
                        onChanged: (value) {
                          
                            editedParagraph = value;
                        
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
   void saveEditedJournalToDb(){
      final newJournal = Journal(title: editedtitle??widget.journalModel.title, paraghraph: editedParagraph??widget.journalModel.paraghraph,dayDate: date??DateTime.now(),journalKey: widget.journalModel.journalKey);
      JournalDB.updateJournal(newJournal);
      showSnackBar(backgroundColor: Colors.green,context: context,text: 'Successfully Edited',textcolor: Colors.white);
       Navigator.pop(context);
  }
}


// import 'package:flutter/material.dart';
// import 'package:mind_sculptor/view/widgets/buttons.dart';

// class JournalviewScreen extends StatelessWidget {
//   const JournalviewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Express youself here',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 600,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(left: 10, top: 15),
//                       child: SizedBox(
//                         height: 40,
//                         child: TextField(
//                           decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               hintText: 'Title',
//                               hintStyle: TextStyle(fontSize: 18)),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: GestureDetector(
//                             child: const SizedBox(
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.calendar_month_outlined),
//                                   Text('select a date'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     const Expanded(
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: Padding(
//                           padding:  EdgeInsets.only(left: 10),
//                           child: TextField(
//                             maxLines: 500,
//                             minLines: 15,
//                             keyboardType: TextInputType.multiline,
//                             decoration:  InputDecoration(
//                                 hintText: 'There are many variations of passages of Lorem Ipsum available but the majority have sufferedalteration in some form, If you are going to use a passage of Lorem Ipsum,There are many variations of passages of Lorem Ipsum available but the majority have sufferedalteration in some form, If you are going to use a passage of Lorem Ipsum,',
//                                 border: OutlineInputBorder(
//                                     borderSide: BorderSide.none)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ButtonClass(
//                   cradius: 20,
//                   height: 59,
//                   width: 370,
//                   text: 'SAVE CHANGES',
//                   onpress: () {

//                   },
//                 ),
//               ),
//               const Text('Delete',style: TextStyle(fontSize: 18),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }