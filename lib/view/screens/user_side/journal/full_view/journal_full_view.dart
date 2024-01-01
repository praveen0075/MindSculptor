import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/journal/journal_write.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';
import 'package:mind_sculptor/view/widgets/scaffoldmessenger.dart';


class JournalviewScreen extends StatefulWidget {
  const JournalviewScreen({super.key, required this.journalModel});
  final Journal journalModel;


  @override
  State<JournalviewScreen> createState() => _JournalviewScreenState();
}

class _JournalviewScreenState extends State<JournalviewScreen> {
  TextEditingController journaltitleController = TextEditingController();

  String? editedtitle;
  String? editedParagraph;
  DateTime? date;
  // String? keyofuser;

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
          IconButton(
              onPressed: () {
                saveEditedJournalToDb();
              },
              icon: const Icon(Icons.done))
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
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Title',
                              ),
                              controller: TextEditingController(
                                  text: widget.journalModel.title),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                              onChanged: (value) {
                                editedtitle = value;
                              },
                            ),
                            sizedBox5,
                            Row(
                              children: [
                                Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        date ?? widget.journalModel.dayDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
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
                                    child: const Icon(
                                      CupertinoIcons.calendar,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            sizedBox20,
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: const InputDecoration.collapsed(
                                        hintText: 'Type here....'),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: TextEditingController(
                                        text: widget.journalModel.paraghraph),
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

  void saveEditedJournalToDb() async {
    
    final newJournal = Journal(
        title: editedtitle ?? widget.journalModel.title,
        paraghraph: editedParagraph ?? widget.journalModel.paraghraph,
        dayDate: date ?? DateTime.now(),
        journalKey: widget.journalModel.journalKey);

    JournalDB.updateJournal(newJournal);
    showSnackBar(
        backgroundColor: Colors.green,
        context: context,
        text: 'Successfully Edited',
        textcolor: Colors.white);
    Navigator.pop(context);
  }
}
