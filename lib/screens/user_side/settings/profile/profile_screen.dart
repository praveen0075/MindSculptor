
import 'package:flutter/material.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/widgets/textfields.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: tc1,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              tc1,lg1,lg2
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:  SingleChildScrollView(
          child: Column(
            children: [
             const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("https://imgs.search.brave.com/F2-JuCznDFyTZacItZl1MFz_oVdn6DBVaT6OBkGRA7o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAxLzI2LzYxLzEz/LzM2MF9GXzEyNjYx/MTMzN19tOGtjUnRT/NUc3QWhyRnBPUTBX/dWZ4NFBnTDZKNHl4/Zy5qcGc"),
                )
              ],
            ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: Column(
                children: [
                  const SizedBox(height: 15,),
                  appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "USERNAME",icon: Icons.person),
                  const SizedBox(height: 15,),
                  appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "praveepravi27@gmail.com",icon: Icons.email_outlined),
                  const SizedBox(height: 15,),
                  appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "Phone",icon: Icons.phone),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(fixedSize: const Size(140, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Save')),
                      )
                    ],
                  )
                ],
              ),
             )
            ],
          ),
        ),
      ),
    );
  }
}