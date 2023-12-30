import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/db_functions/random_tips/random_tipdb_functions.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/admin_side/daily_random_tips/random_tip_display.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';
import 'package:mind_sculptor/view/widgets/textfields.dart';

class DailyTipsAdminScreen extends StatefulWidget {
  const DailyTipsAdminScreen({super.key});

  @override
  State<DailyTipsAdminScreen> createState() => _DailyTipsAdminScreenState();
}

class _DailyTipsAdminScreenState extends State<DailyTipsAdminScreen> {
  final _tip = TextEditingController();

  @override
  void initState() {
    super.initState();
    RandomTipsDb.getTip();
  }

  void addTipToDatabase() async {
    final String tip = _tip.text.trim();
    if (tip.isNotEmpty) {
      RandomTips tipValue = RandomTips(tip: tip);
      await RandomTipsDb.addTip(tipValue);
      await RandomTipsDb.getTip();
      _tip.clear();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text('Mindfulness tips',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
        centerTitle: true,
        backgroundColor: tc1,
        elevation: 0,
      
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            tc1,
            lg1,
            lg2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: appTextField(
                txtcntrlr: _tip,
                iconClr: const Color.fromARGB(255, 213, 195, 28),
                fcolor: Colors.white,
                fieldradi: 20,
                hint: 'Tip',
                icon: Icons.tips_and_updates,
                radi: 20,
                conntentpadding: const EdgeInsets.symmetric(vertical: 36),
              ),
            ),
            ButtonClass(
                cradius: 10,
                height: 40,
                onpress: () {
                  addTipToDatabase();
                },
                text: 'Add tip',
                width: 100,
                bgColor: const MaterialStatePropertyAll(tc1)),
            const RandomTipsDisplay(),
          ],
        ),
      ),
    );
  }
}




   // Expanded(
            //   child: ValueListenableBuilder(
            //     valueListenable: randomTipsnotifier,
            //     builder: (context, box, _) {
            //       if (box.isEmpty) {
            //         return const Center(
            //           child: Text(
            //             'No tips added!',
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         );
            //       } else {
            //         return ScrollConfiguration(
            //           behavior:
            //               const ScrollBehavior().copyWith(overscroll: false),
            //           child: ListView.builder(
            //             itemCount: box.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               var randomtips = box[index];
            //               return ListTile(
            //                 title: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Stack(
            //                     children: [
            //                       SizedBox(
            //                         height: 125,
            //                         child: Card(
            //                           shape: RoundedRectangleBorder(
            //                             borderRadius: BorderRadius.circular(20),
            //                           ),
            //                           elevation: 10,
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Row(
            //                               children: [
            //                                 Flexible(
            //                                     child: Padding(
            //                                   padding:
            //                                       const EdgeInsets.all(8.0),
            //                                   child: Center(
            //                                       child: Text(
            //                                     randomtips.tip.toString(),
            //                                     textAlign: TextAlign.center,
            //                                   )),
            //                                 )),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Positioned(
            //                         bottom: 10,
            //                         right: 10,
            //                         child: InkWell(
            //                             onTap: () {
            //                               deleteTipFromDatabase(index);
            //                             },
            //                             child:
            //                                 const Icon(Icons.delete_outline)),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
