import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
// import 'package:mind_sculptor/model/user_side/journal_model.dart';

class JournalItemCard extends StatefulWidget {
  const JournalItemCard({super.key, required this.smallDescription, required this.journalTitle, required this.dateAdded});


  final String smallDescription;
  final String journalTitle;
  final DateTime? dateAdded;
  
  @override
  State<JournalItemCard> createState() => _JournalItemCardState();
}

class _JournalItemCardState extends State<JournalItemCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)
            ), 
            child: Column(
              children: [
                Text(DateFormat.MMMM().format(widget.dateAdded!),style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                sizedBox5,
                Text(DateFormat.d().format(widget.dateAdded!),style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
                sizedBox5,
                Text(DateFormat.y().format(widget.dateAdded!),style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.journalTitle,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,fontSize: 18)),
                sizedBox5,
                Text(widget.smallDescription,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
              ],
            ),
          ))
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:mind_sculptor/controller/constants/constv.dart';
// import 'package:mind_sculptor/model/user_side/journal_model.dart';

// class JournalItemCard extends StatefulWidget {
//   const JournalItemCard({super.key, required this.journalvalue, required this.smallDescription, required this.journalTitle});

//   final Journal journalvalue;
//   final String smallDescription;
//   final String journalTitle;
  
//   @override
//   State<JournalItemCard> createState() => _JournalItemCardState();
// }

// class _JournalItemCardState extends State<JournalItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10)
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(10)
//             ),
//             child: Column(
//               children: [
//                 Text('MAY',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
//                 sizedBox5,
//                 Text('5',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
//                 sizedBox5,
//                 Text('2023',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
//               ],
//             ),
//           ),
//           Expanded(child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(widget.journalTitle,style: Theme.of(context).textTheme.titleMedium,),
//                 sizedBox5,
//                 Text(widget.smallDescription,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
//               ],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }