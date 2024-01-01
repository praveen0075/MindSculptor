import 'package:flutter/material.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';

class ProfileTextFields extends StatefulWidget {
 const ProfileTextFields({super.key, this.currentUser});
 final User? currentUser;
  @override
  State<ProfileTextFields> createState() => _ProfileTextFieldsState();
}

class _ProfileTextFieldsState extends State<ProfileTextFields> {
  String? editedUsername;
  String? yrname;
  String? editedGmail;
  String? phnNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text:widget.currentUser == null ? " ":widget.currentUser!.username),
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Username',
              ),
              onChanged: (newvalue) {
                if(newvalue.isNotEmpty){
                  setState(() {
                    editedUsername = newvalue;
                  });
                }
              },
            ),
          ),
        ),
         SizedBox(
          child: Card(
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side:  BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text: widget.currentUser == null ? " ":widget.currentUser!.yourName),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Your Name',
              ),
               onChanged: (newvalue) {
                    yrname = newvalue;
              },
            ),
          ),
        ),
         SizedBox(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side:  BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text: widget.currentUser == null ? " ": widget.currentUser!.email),
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Email-id',
              ),
               onChanged: (newvalue) {
                if(newvalue.isNotEmpty){
                  setState(() {
                    editedGmail = newvalue;
                  });
                }
              },
            ),
          ),
        ),
         SizedBox(
          child: Card(
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side:  BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text: widget.currentUser == null ? " ":widget.currentUser!.phoneNumber),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Phone number',
              ),
               onChanged: (newvalue) {
                if(newvalue.isNotEmpty){
                  setState(() {
                    phnNumber = newvalue;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}


// class ProfileTextfields extends  {
  
//   static User? currentUser;
//   static String? editedUsername;
//   static String? yrName;
//   static String? editedGmail;
//   static String? editedPhoneNumber;
//   // static String? userKey;
//   // static User? userModeToStor;
//   // static String uusername = userModeToStor!=null?userModeToStor!.username:'';
//   static Widget profilleTextField({User? currentUser}) {
    
//     return Column(
//       children: [
//         SizedBox(
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 side: BorderSide(style: BorderStyle.solid, width: 2)),
//             elevation: 10,
//             child: TextField(
//               controller: TextEditingController(text:currentUser == null ? " ":currentUser.username),
//               decoration:const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//                 hintText: 'Username',
//               ),
//               onChanged: (newvalue) {
//                 if(newvalue.isNotEmpty){
                  
//                 }
//               },
//             ),
//           ),
//         ),
//          SizedBox(
//           child: Card(
//             shape:const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 side:  BorderSide(style: BorderStyle.solid, width: 2)),
//             elevation: 10,
//             child: TextField(
//               controller: TextEditingController(text: currentUser == null ? " ":currentUser.yourName),
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//                 hintText: 'Your Name',
//               ),
//             ),
//           ),
//         ),
//          SizedBox(
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 side:  BorderSide(style: BorderStyle.solid, width: 2)),
//             elevation: 10,
//             child: TextField(
//               controller: TextEditingController(text: currentUser == null ? " ": currentUser.email),
//               decoration:const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//                 hintText: 'Email-id',
//               ),
//             ),
//           ),
//         ),
//          SizedBox(
//           child: Card(
//             shape:const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 side:  BorderSide(style: BorderStyle.solid, width: 2)),
//             elevation: 10,
//             child: TextField(
//               controller: TextEditingController(text: currentUser == null ? " ":currentUser.phoneNumber),
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//                 hintText: 'Phone number',
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
