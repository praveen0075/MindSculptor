import 'package:flutter/material.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';

class JournalviewScreen extends StatelessWidget {
  const JournalviewScreen({super.key});

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
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Title',
                              hintStyle: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: GestureDetector(
                            child: const SizedBox(
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined),
                                  Text('select a date'),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: TextField(
                            maxLines: 500,
                            minLines: 15,
                            keyboardType: TextInputType.multiline,
                            decoration:  InputDecoration(
                                hintText: 'There are many variations of passages of Lorem Ipsum available but the majority have sufferedalteration in some form, If you are going to use a passage of Lorem Ipsum,There are many variations of passages of Lorem Ipsum available but the majority have sufferedalteration in some form, If you are going to use a passage of Lorem Ipsum,',
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
                  text: 'SAVE CHANGES',
                  onpress: () {
                  
                  },
                ),
              ),
              const Text('Delete',style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
