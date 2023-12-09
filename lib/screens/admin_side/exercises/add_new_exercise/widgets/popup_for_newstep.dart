// import 'package:flutter/material.dart';

// class PopUpForNewExercise extends StatelessWidget {
//   const PopUpForNewExercise({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return showDialog(context: context, builder: )
//     // return Alert(
//     //     context: context,
//     //     title: "LOGIN",
//     //     content: Column(
//     //       children: <Widget>[
//     //         TextField(
//     //           decoration: InputDecoration(
//     //             icon: Icon(Icons.account_circle),
//     //             labelText: 'Username',
//     //           ),
//     //         ),
//     //         TextField(
//     //           obscureText: true,
//     //           decoration: InputDecoration(
//     //             icon: Icon(Icons.lock),
//     //             labelText: 'Password',
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //     buttons: [
//     //       ElevatedButton(
//     //         onPressed: () => Navigator.pop(context),
//     //         child: Text(
//     //           "LOGIN",
//     //           style: TextStyle(color: Colors.white, fontSize: 20),
//     //         ),
//     //       )
//     //     ]).show();  
//   }
// }

import 'package:flutter/material.dart';

showPopForNewStep({context,exerciseStepcontroller,}
//   BuildContext context, {
//   // TextEditingController usernameController,

//   // Function onLoginPressed
// }
) {
  return showDialog(context: context, builder: (context) => AlertDialog(
    actions: [
     ElevatedButton(onPressed: (){}, child:const Text('Save')),
     OutlinedButton(onPressed: (){}, child:const Text('Clear'))
    ],
    elevation: 100,
    shadowColor: Colors.black,
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.white,
    title: const Text('Step 1',textAlign: TextAlign.center,),
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: 280,
      child:  SingleChildScrollView(
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextField(
              decoration: const InputDecoration.collapsed(hintText: 'Type here...'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: exerciseStepcontroller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(top: 10),
                height: 200,
                width: double.maxFinite,
                child: const Icon(Icons.add_photo_alternate_outlined),
              ),
            )
          ],
        ),
      ),
    ),
  ),);
}