import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';


class JournalWriteScreen extends StatefulWidget {
  const JournalWriteScreen({super.key});

  @override
  State<JournalWriteScreen> createState() => _JournalWriteScreenState();
}

class _JournalWriteScreenState extends State<JournalWriteScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController journalController = TextEditingController();

// DateTime selectedDate;
  // DateTime? date;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  'Write Journal',
                  style: TextStyle(
                    fontFamily: GoogleFonts.archivoBlack().fontFamily,color: Colors.black
                  ),
                ),
                centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Express youself here',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                height: 600,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Title',
                              hintStyle: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          sizedBox20,
                          Text(
                              DateFormat('dd/MM/yyyy').format(date),
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
                                }
                              });
                            });
                              },
                              child: const Icon(CupertinoIcons.calendar,color: Colors.black,))
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: journalController,
                            maxLines: 500,
                            minLines: 15,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Type here..',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonClass(
                  cradius: 20,
                  height: 59,
                  width: 370,
                  text: 'SAVE',
                  onpress: () {
                    saveJournalToDb();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveJournalToDb() async {
    String title = titleController.text.trim();
    String journal = journalController.text.trim();
    // DateTime date = selectedDate;
    var newJournalModel = Journal(title: title, paraghraph: journal,dayDate: date);
    if (titleController.text.isEmpty) {
      showSnackBar(
          backgroundColor: Colors.red,
          context: context,
          textcolor: Colors.white,
          text: "Title is not Added");
    } else if (journalController.text.isEmpty) {
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please write something',style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
     );
    } else {
      // JournalDB.getjournal();
      JournalDB.addJournal(newJournalModel);
      journalController.clear();
      titleController.clear();
      date = DateTime.now();
      Navigator.pop(context);
      JournalDB.getjournal();
    }
  }
}
