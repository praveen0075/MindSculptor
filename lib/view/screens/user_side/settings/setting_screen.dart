import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/view/screens/authentication/first_screen/first_screen.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/about/about_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/privacy%20policy/privacypolicy_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/profile/profile_screen.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/terms%20and%20conditions/terms_and_conditions.dart';
import 'package:mind_sculptor/view/widgets/setting_screen_tiles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
         title:  Text('Settings',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily,color: Colors.black)),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            sizedBox10,
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
                shareApp(context);
              },
              child: settingsScreenTiles(avatarColor: Colors.green.shade100,icon: Icons.share_outlined,title: "Share",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.green)),
            sizedBox10,
            InkWell(
              onTap: (){
                screenNavigation(context: context,screen: const AbooutScreen());
              },
              child: settingsScreenTiles(avatarColor: Colors.purple.shade100,icon:Icons.info_outline,title: "About",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.purple)),
               sizedBox10,
            InkWell(
              onTap: (){
                screenNavigation(context: context,screen: const TermsAndCondtions());
              },
              child: settingsScreenTiles(avatarColor: Colors.orange.shade100,icon:Icons.document_scanner_outlined,title: "Terms & conidtions",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.orange)),
            const Divider(
              height: 50,
            ),
            
            InkWell(
              onTap: ()async{
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                   title: const Text('Log out'),
                   content: const Text('Are you sure you want to log out?'),
                   actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text("Cancel")),
                    TextButton(onPressed: ()async{
                      Navigator.pop(context);
                      final sharedpref = await SharedPreferences.getInstance();
                      await sharedpref.remove('userEntered');
                      final shredpre = await SharedPreferences.getInstance();
                      await shredpre.remove('userEnteredId');
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
  void shareApp(BuildContext context){
    Share.share('Check out this Amazing app:[]');
  }
}