
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/user_side/journal/full_view/journal_full_view.dart';

class Frontviewcard extends StatelessWidget {
  const Frontviewcard({
    super.key,
    required this.widget,
  });

  final JournalviewScreen widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 20,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Padding(
              //    padding: const EdgeInsets.all(8.0),
              //  child: Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //         Container(
              //           child: Text('12/12/2023',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20)),
              //         )
              //  Container(
              //        width: 100,
              //        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              //        decoration: BoxDecoration(
              //          color: Colors.red,
              //          borderRadius: BorderRadius.circular(10)
              //        ),
              //        child: Column(
              //          children: [
              //            Text('MAY',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
              //            sizedBox5,
              //            Text('5',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
              //            sizedBox5,
              //            Text('2023',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
              //            // Text(DateFormat.MMMM().format(widget.dateAdded!),style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
              //            // sizedBox5,
              //            // Text(DateFormat.d().format(widget.dateAdded!),style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
              //            // sizedBox5,
              //            // Text(DateFormat.y().format(widget.dateAdded!),style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
              //          ],
              //        ),
              //      ),
              //     ],
              //    ),
              //  ),
              sizedBox10,
              Text(
                widget.journalModel.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              sizedBox5,
              SizedBox(
                child: Text(DateFormat('dd/MM/yyyy').format(widget.journalModel.dayDate),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium 
                        ?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
              ),
              sizedBox20,
              Expanded(
                child: SizedBox(
                  
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: SingleChildScrollView(
                      child: Column(
                        // color: Colors.blue,
                                    
                        children: [Text(widget.journalModel.paraghraph,style: const TextStyle(fontSize: 18),)],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          
        )
      ),
    );
  }
}
