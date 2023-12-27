
import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/user/authentication_db_functions.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/profile/widgets/textfields_of_profile.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  User? usermodel;
  Future <void> fetchUserDetails()async{
    final model = await UserDb.getUserById(UserDb.userId??'');
    if(model != null){
      usermodel = model;
    }
  }
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
                  ProfileTextfields.profilleTextField(userModel: usermodel),
                //  ProfileTextfields.profilleTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "Username",icon: Icons.email_outlined,controllerText: ProfileTextfields.userModeToStor!.username), 
                //   const SizedBox(height: 15,),
                //   ProfileTextfields.profilleTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "Your name",icon: Icons.email_outlined),
                //   const SizedBox(height: 15,),
                //   ProfileTextfields.profilleTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "E-mail id",icon: Icons.email_outlined),
                //   const SizedBox(height: 15,),
                //   ProfileTextfields.profilleTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "Phone number",icon: Icons.email_outlined),
                //    const SizedBox(height: 15,),
                  // appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "USERNAME",icon: Icons.person,),
                  // const SizedBox(height: 15,),
                  // appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "praveepravi27@gmail.com",icon: Icons.email_outlined),
                  // const SizedBox(height: 15,),
                  // appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "Phone",icon: Icons.phone),
                  // const SizedBox(height: 15,),
                  // appTextField(fcolor: Colors.white,fieldradi: 20,radi: 15,hint: "Phone",icon: Icons.phone),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: (){
                          // print();
                        },style: ElevatedButton.styleFrom(fixedSize: const Size(140, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Save')),
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