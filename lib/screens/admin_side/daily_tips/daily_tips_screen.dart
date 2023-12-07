import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/admin_side/randomtip_model.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/widgets/buttons.dart';
import 'package:mind_sculptor/widgets/textfields.dart';

class DailyTipsAdminScreen extends StatefulWidget {
  const DailyTipsAdminScreen({super.key});

  @override
  State<DailyTipsAdminScreen> createState() => _DailyTipsAdminScreenState();
}

class _DailyTipsAdminScreenState extends State<DailyTipsAdminScreen> {
  final _tip = TextEditingController();
  late Box<RandomTips> mindfullnesstips;
  @override
  void initState() {
    super.initState();
    mindfullnesstips = Hive.box('randomtips');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindfulness Tips'),
        backgroundColor: tc1,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            tc1,
            lg1,
            tc2,
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
                  conntentpadding: const EdgeInsets.symmetric(vertical: 36)
                  ),
            ),
            ButtonClass(cradius: 10,height: 40,onpress: (){ 
               String randomTipText = _tip.text.trim();
                  if (randomTipText.isNotEmpty) {
                    RandomTips randomTip =
                        mindfullnesstips.get(0, defaultValue: RandomTips([])) ??
                            RandomTips([]);
                    randomTip.tip.add(randomTipText);
                    mindfullnesstips.put(0, randomTip);
                    _tip.clear();
                    setState(() {});
                  }
            },text: 'Add tip',width: 100,bgColor: const MaterialStatePropertyAll(tc1)),
            Expanded(
              child: ValueListenableBuilder<Box<RandomTips>>(
                valueListenable: mindfullnesstips.listenable(),
                builder: (context, box, _) {
                  RandomTips tipModel =
                      box.get(0, defaultValue: RandomTips([])) ??
                          RandomTips([]);
                  return ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      itemCount: tipModel.tip.length,
                      itemBuilder: (BuildContext context, int index) {
                        final tip = tipModel.tip[index];
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
                                            child: Center(child: Text(tip,textAlign: TextAlign.center,)),
                                          )),    
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                   Positioned(
                                    bottom: 10,
                                    right: 10,
                                     child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        RandomTips tipModel =
                                                            mindfullnesstips.get(0,
                                                                    defaultValue:
                                                                        RandomTips(
                                                                            [])) ??
                                                                RandomTips([]);
                                                        tipModel.tip.removeAt(index);
                                                        mindfullnesstips.put(
                                                            0, tipModel);
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons.delete_outline)),
                                   )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
