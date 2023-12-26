import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
// import 'package:mind_sculptor/view/screens/user_side/journal/full_view/journal_full_view.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';

class RearviewCard extends StatefulWidget {
  const RearviewCard({
    super.key,
    required this.journalModel,
  });

  final Journal journalModel;
  @override
  State<RearviewCard> createState() => _RearviewCardState();
}

class _RearviewCardState extends State<RearviewCard> {
  String? editedtitle;
  String? editedParagraph;
  DateTime? date;


  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  // widget.journalModel.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      editedtitle = value;
                    }
                  },
                ),
                sizedBox5,
                Row(
                  children: [
                            Text(
                      DateFormat('dd/MM/yyyy')
                            .format(widget.journalModel.dayDate),
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
                                  lastDate: DateTime(2050))
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
        ));
  }

  void saveEditedJournalToDb(){
      final newJournal = Journal(title: editedtitle??widget.journalModel.title, paraghraph: editedParagraph??widget.journalModel.paraghraph,dayDate: date??DateTime.now(),journalKey: widget.journalModel.journalKey);
      JournalDB.updateJournal(newJournal);
      showSnackBar(backgroundColor: Colors.green,context: context,text: 'Eidted successfully',textcolor: Colors.white);
  }
}
