import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
// import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/display/journal_screen.dart';
// import 'package:mind_sculptor/view/screens/user_side/journal/journal%20write/widgets/calendar_view.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';
import 'package:mind_sculptor/view/widgets/screen_navigation.dart';

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
                          // onChanged: (newValue) {

                          // },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        sizedBox20,
                        MaterialButton(
                          onPressed: () {
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
                          color: Colors.blue,
                          child: Text(
                            DateFormat('dd/MM/yyyy').format(date),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                        // CalendarViewToPickDate(onselectedDate: (DateTime date){

                        // }),
                        // CalendarViewToPickDate(),
                      ],
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
      showSnackBar(
          backgroundColor: Colors.red,
          context: context,
          textcolor: Colors.red,
          text: "Please write something");
    } else {
      // JournalDB.getjournal();
      JournalDB.addJournal(newJournalModel);
      pushReplacementNavigator(
          context: context, screenName: const JournalScreen());
      // JournalDB.getjournal();
    }
  }
}
