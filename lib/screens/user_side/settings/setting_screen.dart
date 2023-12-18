import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/screens/user_side/first_screen/first_screen.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/screens/user_side/settings/about/about_screen.dart';
import 'package:mind_sculptor/screens/user_side/settings/privacy%20policy/privacypolicy_screen.dart';
import 'package:mind_sculptor/screens/user_side/settings/profile/profile_screen.dart';
import 'package:mind_sculptor/widgets/setting_screen_tiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
         title:  Text('Settings',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily,color: Colors.black)),
      ),
      body:  Center(
        child:  Column(
          children: [
            sizedBox10,
           const  CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage('https://imgs.search.brave.com/F2-JuCznDFyTZacItZl1MFz_oVdn6DBVaT6OBkGRA7o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAxLzI2LzYxLzEz/LzM2MF9GXzEyNjYx/MTMzN19tOGtjUnRT/NUc3QWhyRnBPUTBX/dWZ4NFBnTDZKNHl4/Zy5qcGc'),
              radius: 50,
            ),
            sizedBox30, 
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
              },
              child: settingsScreenTiles(avatarColor: Colors.blue.shade100,icon: CupertinoIcons.person,title: "Profile",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.blue)),
            sizedBox10,
            InkWell(  
              onTap: () {
                screenNavigation(context: context,screen: const PrivacyPolicyScreen());
              },
              child: settingsScreenTiles(avatarColor: Colors.orange.shade100,icon: Icons.privacy_tip_outlined,title: "Privacy",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.orange)),
            sizedBox10,
            InkWell(
              onTap: (){
                
              },
              child: settingsScreenTiles(avatarColor: Colors.green.shade100,icon: Icons.share_outlined,title: "Share",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.green)),
            sizedBox10,
            InkWell(
              onTap: (){
                screenNavigation(context: context,screen: const AbooutScreen());
              },
              child: settingsScreenTiles(avatarColor: Colors.purple.shade100,icon:Icons.info_outline,title: "About",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.purple)),
            const Divider(
              height: 50,
            ),
            InkWell(
              onTap: ()async{
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                   title: const Text('Log out'),
                   content: const  Text('Are you sure you want to log out?'),
                   actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text("Cancel")),
                    TextButton(onPressed: ()async{
                      Navigator.pop(context);
                      final sharedpref = await SharedPreferences.getInstance();
                      await sharedpref.remove('userEntered');
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FirstScreen(),), (route) => false);
                    }, child: const Text("Log out")),
                   ],
                  );
                },);
              },
                child: settingsScreenTiles(avatarColor: Colors.red.shade100,icon:Icons.logout,title: "LogOut",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.red)),
            const Divider(
              height: 50,
            )
          ],
        ),
      )
    );
  }
}