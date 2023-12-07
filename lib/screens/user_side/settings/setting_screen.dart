import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/first_screen/first_screen.dart';
import 'package:mind_sculptor/constants/constv.dart';
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
        title: const Text('Settings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body:  Center(
        child:  Column(
          children: [
            sizedBox10,
           const  CircleAvatar(
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

              },
              child: settingsScreenTiles(avatarColor: Colors.purple.shade100,icon:Icons.info_outline,title: "About",traingIcon: CupertinoIcons.right_chevron,avatarIconColor: Colors.purple)),
            const Divider(
              height: 50,
            ),
            InkWell(
              onTap: ()async{
                final sharedpref = await SharedPreferences.getInstance();
                await sharedpref.remove('userEntered');
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FirstScreen(),), (route) => false);
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