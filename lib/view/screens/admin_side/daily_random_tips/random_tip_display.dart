import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/db_functions/random_tips/random_tipdb_functions.dart';

class RandomTipsDisplay extends StatelessWidget {
  const RandomTipsDisplay({super.key});

  void deleteTipFromDatabase(int index) {
    RandomTipsDb.deletTip(index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ValueListenableBuilder(
      valueListenable: randomTipsnotifier,
      builder: (context, box, _) {
        if (box.isEmpty) {
          return const Center(
            child: Text(
              'No tips added!',
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.builder(
              itemCount: box.length,
              itemBuilder: (BuildContext context, int index) {
                var randomtips = box[index];
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 125,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: TextField(
                                        decoration: const InputDecoration(border: InputBorder.none,hintText: 'Write here'),
                                        controller: TextEditingController(text: randomtips.tip),
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          randomtips.tip = value;
                                        },
                                      ),
                                    //     child: Text(
                                    //   randomtips.tip.toString(),
                                    //   textAlign: TextAlign.center,
                                    // )
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: 
                              InkWell(
                                  onTap: () {
                                    deleteTipFromDatabase(index);
                                  },
                                  child: const Icon(Icons.delete_outline)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    ));
  }
}
